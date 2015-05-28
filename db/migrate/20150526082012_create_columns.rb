class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.string :title
      t.string :url
      t.string :status

      t.timestamps null: false
    end
  end
end
