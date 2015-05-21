class CreateInvestigates < ActiveRecord::Migration
  def change
    create_table :investigates do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
