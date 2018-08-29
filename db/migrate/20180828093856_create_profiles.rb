class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :birthdate
      t.string :address_1
      t.string :address_2
      t.integer :city_id
      t.integer :province_id
      t.integer :phone

      t.timestamps
    end
  end
end
