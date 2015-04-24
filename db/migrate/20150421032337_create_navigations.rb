class CreateNavigations < ActiveRecord::Migration
  def change
    create_table :navigations do |t|
      t.string :title
      t.string :url
      t.string :online_date

      t.timestamps null: false
    end
  end
end
