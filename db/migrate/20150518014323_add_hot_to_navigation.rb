class AddHotToNavigation < ActiveRecord::Migration
  def change
    add_column :navigations, :hot, :string
  end
end
