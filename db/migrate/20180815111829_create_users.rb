class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.boolean :email_opt_in
      t.boolean :enabled

      t.timestamps
    end
  end
end
