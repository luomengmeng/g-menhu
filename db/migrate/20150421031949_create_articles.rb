class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :abstact
      t.string :content
      t.integer :status
      t.boolean :home

      t.timestamps null: false
    end
  end
end