class AddProblemIdToNavigation < ActiveRecord::Migration
  def change
    add_column :navigations, :problem_id, :integer
  end
end
