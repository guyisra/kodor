class AddDatesToUser < ActiveRecord::Migration
  def up
    add_column :users, :start_date, :datetime
    add_column :users, :end_date, :datetime
  end
  
  def down
    remove_column :users, :start_date
    remove_column :users, :end_date
  end
end
