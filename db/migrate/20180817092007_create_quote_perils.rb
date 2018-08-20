class CreateQuotePerils < ActiveRecord::Migration[5.1]
  def change
    create_table :quote_perils do |t|
      t.integer :quote_id
      t.integer :subline_id
      t.integer :peril_id
      t.integer :premium_id
      t.decimal :sum_insured, precision: 12, scale: 2
      t.decimal :base_prem, precision: 12, scale: 2
      t.decimal :total_charges, precision: 12, scale: 2
      t.decimal :gross_prem, precision: 12, scale: 2
      t.integer :policy_id

      t.timestamps
    end
  end
end
