class CreateQuoteVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :quote_vehicles do |t|
      t.integer :quote_id
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
