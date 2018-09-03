class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.integer :year_model
      t.integer :brand_id
      t.integer :model_id

      t.timestamps
    end
  end
end
