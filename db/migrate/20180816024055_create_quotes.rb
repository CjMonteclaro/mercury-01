class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.integer :subline_id
      t.integer :peril_id
      t.integer :premium_id
      t.integer :policy_id
      t.integer :user_id
      t.decimal :coverage_limit, precision: 12, scale: 2
      t.integer :coverage_duration
      t.decimal :base_prem, precision: 12, scale: 2
      t.decimal :total_charges, precision: 12, scale: 2
      t.decimal :gross_prem, precision: 12, scale: 2

      t.timestamps
    end
  end
end
