class CreateChargeTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :charge_types do |t|
      t.string :name
      t.string :shortname
      t.integer :creator_id

      t.timestamps
    end
  end
end
