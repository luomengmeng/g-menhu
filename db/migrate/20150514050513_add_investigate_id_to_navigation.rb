class AddInvestigateIdToNavigation < ActiveRecord::Migration
  def change
    add_column :navigations, :investigate_id, :integer
  end
end
