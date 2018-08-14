class CreatePerils < ActiveRecord::Migration[5.1]
  def change
    create_table :perils do |t|
      t.integer :line_id
      t.string :name
      t.string :shortname
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end
