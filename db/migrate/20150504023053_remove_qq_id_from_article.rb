class RemoveQqIdFromArticle < ActiveRecord::Migration
  def change
    remove_column :articles, :qq_id, :integer
  end
end
