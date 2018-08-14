class CreatePremiums < ActiveRecord::Migration[5.1]
  def change
    create_table :premiums do |t|
      t.integer :subline_id
      t.integer :peril_id
      t.string :subline_factor
      t.decimal :coverage_limit
      t.integer :coverage_duration
      t.decimal :premium, precision: 6, scale: 2
      t.string :prem_type
      t.boolean :taxed

      t.timestamps
    end
  end
end
