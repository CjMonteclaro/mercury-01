class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.integer :year_model
      t.integer :brand_id
      t.integer :model_id
      t.string :mv_file_no
      t.string :plate_no
      t.string :engine_no
      t.string :chassis_no

      t.timestamps
    end
  end
end
