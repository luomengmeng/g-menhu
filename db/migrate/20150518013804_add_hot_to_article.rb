class AddHotToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :hot, :string
  end
end
