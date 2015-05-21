class AddLogoToNavigation < ActiveRecord::Migration
  def change
    add_column :navigations, :logo, :string
  end
end
