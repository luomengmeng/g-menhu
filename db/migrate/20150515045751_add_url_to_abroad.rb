class AddUrlToAbroad < ActiveRecord::Migration
  def change
    add_column :abroads, :url, :string
  end
end
