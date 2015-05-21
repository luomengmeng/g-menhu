class CreateAbroads < ActiveRecord::Migration
  def change
    create_table :abroads do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
