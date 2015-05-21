class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :name
      t.string :name_url
      t.integer :status

      t.timestamps null: false
    end
  end
end
