class AddCategoriesIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :categories_id, :integer
  end
end
