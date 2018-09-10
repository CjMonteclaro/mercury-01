class CreateClaimsTats < ActiveRecord::Migration[5.1]
  def change
    create_table :claims_tats do |t|
      t.integer :genweb_claim_id
      t.boolean :attached_estimate
      t.date :complete_doc
      t.date :to_adjuster
      t.date :final_report
      t.date :approved_claims
      t.date :loa
      t.date :shop_out
      t.date :invoice_received
      t.date :request_payment
      t.date :to_audit
      t.date :to_treasury

      t.timestamps
    end
  end
end
