class GiclClaim < ApplicationRecord

  octopus_establish_connection(adapter: "oracle_enhanced", database: "FGIC", host: "172.16.110.241", port: "1521", username: "CPI", password: "CPI12345!")

  self.table_name = "gicl_claims"
  self.primary_key = "claim_id"

  alias_attribute :line_code, :line_cd
  alias_attribute :subline_code, :subline_cd
  alias_attribute :source, :iss_cd
  alias_attribute :claim_year, :clm_yy
  alias_attribute :sequence_number, :clm_seq_no

  alias_attribute :issue_year, :issue_yy
  alias_attribute :policy_source, :pol_iss_cd
  alias_attribute :pol_sequence_number, :pol_seq_no
  alias_attribute :renewal_number, :renew_no

  alias_attribute :effectivity_date, :pol_eff_date
  alias_attribute :date_reported, :clm_file_date
  alias_attribute :status, :clm_stat_cd
  alias_attribute :adjuster, :in_hou_adj

  has_one :claims_tat, foreign_key: :genweb_claim_id
  has_one :giis_loss_ctgry, foreign_key: :loss_cat_cd, primary_key: :loss_cat_cd
  has_one :giis_clm_stat, foreign_key: :clm_stat_cd, primary_key: :clm_stat_cd

  has_many :gicl_item_perils, foreign_key: :claim_id
  has_many :giac_direct_claim_payts, foreign_key: :claim_id
  has_many :gicl_clm_loss_exps, foreign_key: :claim_id

  has_many :giac_chk_release_infos, through: :giac_direct_claim_payts, foreign_key: :gacc_tran_id
  has_many :giis_perils, through: :gicl_item_perils, foreign_key: :peril_cd, primary_key: :peril_cd
  has_many :giis_payees, through: :gicl_clm_loss_exps, foreign_key: :payee_class_cd, primary_key: :payee_class_cd
  has_many :giis_payee_classes, through: :gicl_clm_loss_exps, foreign_key: :payee_class_cd, primary_key: :payee_class_cd

  belongs_to :giis_assured, foreign_key: :assd_no

  def no
    "#{line_code}-#{subline_code}-#{source}-#{claim_year}-#{proper_seq_no}"
  end

  def polbasic
    GipiPolbasic.find_by(line_cd: self.line_cd, subline_cd: self.subline_cd, source: self.policy_source, issue_yy: self.issue_yy, pol_seq_no: self.pol_seq_no, renew_no: self.renew_no)
  end

  def proper_seq_no
    sprintf '%07d', sequence_number
  end

  def loss_category
    GiisLossCtgry.where(line_cd: self.line_cd, loss_cat_cd: self.loss_cat_cd).collect(&:description).first
  end

  def cost
    (self.loss_res_amt * 1.12).round(2) if self.loss_res_amt
  end

  ######

  def get_loss_payment
    if self.loss_pd_amt.present?
      self.loss_pd_amt
    else
      0
    end
  end

  def disbursements
    GiacChkDisbursement.where(gacc_tran_id: self.giac_direct_claim_payts.collect(&:gacc_tran_id))
  end

  def months_between(effectivity_date, loss_date)
      effectivity_date = self.effectivity_date.to_date
      loss_date = self.loss_date.to_date

      (loss_date.month - effectivity_date.month) + 12 * (loss_date.year - effectivity_date.year)
  end

# TAT Computation
  def loss_to_reported_tat
    self.loss_date.business_days_until(self.date_reported) + 1
  end

  def reported_to_completed_tat
    self.date_reported.business_days_until(self.claims_tat.complete_doc) + 1  unless self.claims_tat.nil?
  end

  def completed_to_assignment_tat
    self.claims_tat.complete_doc.business_days_until(self.claims_tat.assigned_to_adjuster) + 1 unless self.claims_tat.nil?
  end

  def assignment_to_report_tat
    self.claims_tat.assigned_to_adjuster.business_days_until(self.claims_tat.final_report) + 1 unless self.claims_tat.nil?
  end

  def report_to_approved_tat
    self.claims_tat.final_report.business_days_until(self.claims_tat.approved) + 1 unless self.claims_tat.nil?
  end

  def approved_to_loa_tat
    self.claims_tat.approved.business_days_until(self.claims_tat.loa_release) + 1 unless self.claims_tat.nil?
  end

  def loa_to_shop_out_tat
    self.claims_tat.loa_release.business_days_until(self.claims_tat.shop_out) + 1 unless self.claims_tat.nil?
  end

  def shop_out_to_inv_rcv_tat
    self.claims_tat.shop_out.business_days_until(self.claims_tat.invoice_received) + 1 unless self.claims_tat.nil?
  end

  def inv_rcv_to_pymt_req_tat
    self.claims_tat.invoice_received.business_days_until(self.claims_tat.payment_request) + 1 unless self.claims_tat.nil?
  end

  def pymt_req_to_chk_prep_tat
    self.giac_direct_claim_payts.each do |payment|
      payment.giac_chk_disbursements.each do |disbursement|
        @check_date = disbursement.check_date unless disbursement.nil?
      end
    end
    self.claims_tat.payment_request.business_days_until(@check_date) + 1 unless self.claims_tat.nil?
  end

  def chk_prep_to_audit_tat
    @check_date.business_days_until(self.claims_tat.to_audit) + 1 unless self.claims_tat.nil?
  end

  def audit_to_treasury_tat
    self.claims_tat.to_audit.business_days_until(self.claims_tat.to_treasury) + 1 unless self.claims_tat.nil?
  end

  def treasury_to_chk_rls_tat
    self.giac_direct_claim_payts.each do |payment|
      payment.giac_chk_release_infos.each do |check_info|
        @check_release_date = check_info.check_release_date unless check_info.nil?
      end
    end
    self.claims_tat.to_treasury.business_days_until(@check_release_date) + 1 unless self.claims_tat.nil?
  end
end
