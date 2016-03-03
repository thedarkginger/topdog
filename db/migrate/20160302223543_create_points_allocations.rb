class CreatePointsAllocations < ActiveRecord::Migration
  def change
   	 create_table :points_allocations do |t|
      t.references :game, index: true
      t.integer :place, null: false
      t.integer :points, null: false

      t.timestamps
    end
  end
end
