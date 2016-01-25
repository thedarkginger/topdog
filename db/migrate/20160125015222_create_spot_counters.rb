class CreateSpotCounters < ActiveRecord::Migration
  def change
    create_table :spot_counters do |t|
      t.integer :count, default: 0
      t.integer :user_id
      t.string :category

      t.timestamps
    end
  end
end
