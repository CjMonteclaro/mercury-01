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

  has_one :giis_loss_ctgry, foreign_key: :loss_cat_cd, primary_key: :loss_cat_cd
  has_one :giis_clm_stat, foreign_key: :clm_stat_cd, primary_key: :clm_stat_cd

  has_many :gicl_item_perils, foreign_key: :claim_id
  has_many :gicl_clm_loss_exps, foreign_key: :claim_id
  has_many :giac_direct_claim_payts, foreign_key: :claim_id

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

  def months_between(effectivity_date, loss_date)
      effectivity_date = self.effectivity_date.to_date
      loss_date = self.loss_date.to_date

      (loss_date.month - effectivity_date.month) + 12 * (loss_date.year - effectivity_date.year)
  end

  def calendar_dates(loss_date, date_reported)
    (date_reported.to_date - loss_date.to_date + 1).to_i
  end

  def business_days_between(loss_date, date_reported)
    business_days = 0
    date = date_reported
    while date > loss_date
     business_days = business_days + 1 unless date.saturday? or date.sunday?
     date = date - 1.day
    end
    business_days
  end

  def loss_category
    GiisLossCtgry.where(line_cd: self.line_cd, loss_cat_cd: self.loss_cat_cd).collect(&:description).first
  end

  def cost
    (self.loss_res_amt * 1.12).round(2) if self.loss_res_amt
  end
end
