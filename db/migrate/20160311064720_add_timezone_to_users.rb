class AddTimezoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :timezone, :date_time
  end
end
