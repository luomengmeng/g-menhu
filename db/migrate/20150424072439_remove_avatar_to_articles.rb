class RemoveAvatarToArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :avater, :string
  end
end
