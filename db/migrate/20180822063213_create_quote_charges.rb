class CreateQuoteCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :quote_charges do |t|
      t.integer :quote_id
      t.integer :charge_rate_id
      t.integer :charge_type_id
      t.decimal :charge_amount, precision: 12, scale: 2

      t.timestamps
    end
  end
end
