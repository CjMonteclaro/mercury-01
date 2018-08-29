class CreateClaimsTats < ActiveRecord::Migration[5.1]
  def change
    create_table :claims_tats do |t|
      t.integer :genweb_claim_id
      t.date :completion_of_document
      t.date :assigned_to_adjuster
      t.date :approved
      t.date :loa
      t.date :out_from_shop
      t.date :received_invoice
      t.date :payment_request
      t.date :to_audit
      t.date :to_treasury
      t.boolean :with_estimate

      t.timestamps
    end
  end
end
