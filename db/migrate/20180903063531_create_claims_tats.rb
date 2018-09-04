class CreateClaimsTats < ActiveRecord::Migration[5.1]
  def change
    create_table :claims_tats do |t|
      t.integer :genweb_claim_id
      t.date :completion_of_document
      t.integer :cod_to_adjuster_tat
      t.date :assigned_to_adjuster
      t.integer :adjuster_approval_tat
      t.date :approved
      t.integer :approval_to_loa
      t.date :loa_release
      t.integer :loa_release_to_out_from_shop_tat
      t.date :out_from_shop
      t.integer :shop_to_invoice_recieved_tat
      t.date :invoice_recieved
      t.integer :recieved_invoice_to_payment_request_tat
      t.date :payment_request
      t.integer :pr_to_audit_tat
      t.date :to_audit
      t.integer :audit_to_treasury_tat
      t.date :to_treasury
      t.boolean :with_estimate

      t.timestamps
    end
  end
end
