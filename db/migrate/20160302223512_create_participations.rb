class CreateParticipations < ActiveRecord::Migration
  def change
   	 create_table :participations do |t|
      t.references :user, index: true
      t.references :game, index: true
      t.integer :ranking, null: false, default: 0

      t.timestamps
    end
  end
end
