class AddGameStartToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :game_start, :datetime
  end
end
