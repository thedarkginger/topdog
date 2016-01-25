class CreateSpotCounters < ActiveRecord::Migration
  def change
    create_table :spot_counters do |t|
      t.integer :count
      t.integer :user_id
      t.string :category

      t.timestamps
    end
  end
end
