class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :ranking
      t.datetime :game_time
    end
  end
end
