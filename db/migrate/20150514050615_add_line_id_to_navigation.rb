class AddLineIdToNavigation < ActiveRecord::Migration
  def change
    add_column :navigations, :line_id, :integer
  end
end
