class CreateLines < ActiveRecord::Migration[5.1]
  def change
    create_table :lines do |t|
      t.string :name
      t.string :shortname
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end
