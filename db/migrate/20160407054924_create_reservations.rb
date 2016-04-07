class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :game_id
      t.integer :user_id
    end
  end
end
