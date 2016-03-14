class AddTimezonesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :timezones, :datetime
  end
end
