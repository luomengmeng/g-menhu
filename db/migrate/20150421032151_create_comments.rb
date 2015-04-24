class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :news_id
      t.integer :comments_id
      t.integer :reply_id

      t.timestamps null: false
    end
  end
end
