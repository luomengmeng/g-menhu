class RemoveCategoriesIdFromArticle < ActiveRecord::Migration
  def change
    remove_column :articles, :categories_id, :string
  end
end
