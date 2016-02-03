class ChangeStartTimeColumn < ActiveRecord::Migration
  def change
  	change_column :games, :start_time,  :datetime
  end
end
