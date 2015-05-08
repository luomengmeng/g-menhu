class AddNumToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :num, :integer
  end
end
