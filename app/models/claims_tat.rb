class ClaimsTat < ApplicationRecord

  belongs_to :gicl_claim, foreign_key: :claim_id, optional: true

  def compute_tat

    cod_to_adjuster_tat = self.assigned_to_adjuster - self.completion_of_document
    adjuster_to_approval_tat = self.approved - self.assigned_to_adjuster
    approval_to_loa = self.loa_release - self.approved
    loa_release_to_out_from_shop_tat = self.out_from_shop - self.loa_release
    shop_to_invoice_recieved_tat = self.invoice_recieved - self.out_from_shop
    recieved_invoice_to_payment_request_tat = self.payment_request - self.invoice_recieved
    pr_to_audit_tat = self.to_audit - self.payment_request
    audit_to_treasury_tat = self.to_treasury - self.to_audit

    self.update(
      cod_to_adjuster_tat: cod_to_adjuster_tat,
      adjuster_approval_tat: adjuster_to_approval_tat,
      approval_to_loa: approval_to_loa,
      loa_release_to_out_from_shop_tat: loa_release_to_out_from_shop_tat,
      shop_to_invoice_recieved_tat: shop_to_invoice_recieved_tat,
      recieved_invoice_to_payment_request_tat: recieved_invoice_to_payment_request_tat,
      pr_to_audit_tat: pr_to_audit_tat,
      audit_to_treasury_tat: audit_to_treasury_tat
      )

  end

  def self.to_csv
    attributes = ['Assured' 'ClaimNo' 'Broker/Agent' 'Effectivity' 'Diagnosis' 'Policy_Effectivity_to_Loss_Date' 'PolicyNo' 'Loss_Category' 'Date_of_Loss' 'Date_Reported' 'TAT' 'Documents_Completion' 'Claims_Approval']
    CSV.generate(headers: true) do |csv|
      csv << attributes

        ClaimsTat.all.each do |policy|
        csv << [policy.no, policy.endorsement_no,policy.assured.name, policy.intermediary&.name, policy.incept_date, policy.expiry_date, policy.eff_date, policy.prem_amt]
      end
    end
  end

end
