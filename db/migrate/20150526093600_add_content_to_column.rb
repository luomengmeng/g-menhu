class AddContentToColumn < ActiveRecord::Migration
  def change
    add_column :columns, :content, :text
  end
end
