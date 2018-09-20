class CreateClaimsTats < ActiveRecord::Migration[5.1]
  def change
    create_table :claims_tats do |t|
      t.integer :genweb_claim_id
      t.boolean :with_estimate
      t.date :complete_doc
      t.date :assigned_to_adjuster
      t.date :final_report
      t.date :approved
      t.date :loa_release
      t.date :shop_out
      t.date :invoice_received
      t.date :payment_request
      t.date :to_audit
      t.date :to_treasury

      t.timestamps
    end
  end
end
