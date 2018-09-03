class CreateQuoteVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :quote_vehicles do |t|
      t.integer :quote_id
      t.integer :vehicle_id
      t.string :mv_file_no
      t.string :plate_no
      t.string :engine_no
      t.string :chassis_no

      t.timestamps
    end
  end
end
