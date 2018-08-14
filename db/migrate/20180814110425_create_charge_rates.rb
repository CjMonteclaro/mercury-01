class CreateChargeRates < ActiveRecord::Migration[5.1]
  def change
    create_table :charge_rates do |t|
      t.integer :charge_type_id
      t.string :qualifier
      t.decimal :rate, precision: 6, scale: 2
      t.string :rate_type

      t.timestamps
    end
  end
end
