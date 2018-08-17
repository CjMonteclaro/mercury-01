class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.integer :subline_id
      t.integer :peril_id
      t.integer :premium_id
      t.decimal :coverage_limit
      t.integer :coverage_duration
      t.decimal :base_prem
      t.decimal :total_charges
      t.decimal :gross_prem

      t.timestamps
    end
  end
end
