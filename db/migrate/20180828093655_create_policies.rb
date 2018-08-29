class CreatePolicies < ActiveRecord::Migration[5.1]
  def change
    create_table :policies do |t|
      t.integer :user_id
      t.integer :quote_id
      t.string :online_policy_no
      t.string :genweb_policy_no
      t.string :genweb_bill_no
      t.string :genweb_receipt_no

      t.timestamps
    end
  end
end
