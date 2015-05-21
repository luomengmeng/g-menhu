class RemoveAuthorFromArticle < ActiveRecord::Migration
  def change
    remove_column :articles, :author, :integer
  end
end
