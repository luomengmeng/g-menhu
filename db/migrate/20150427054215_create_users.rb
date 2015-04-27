class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :name
      t.integer :status
      t.integer :type

      t.timestamps null: false
    end
  end
end
