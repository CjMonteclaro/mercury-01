class CreateQuotePerils < ActiveRecord::Migration[5.1]
  def change
    create_table :quote_perils do |t|
      t.integer :quote_id
      t.integer :peril_id
      t.integer :policy_id
      t.decimal :sum_insured
      t.decimal :premium

      t.timestamps
    end
  end
end
