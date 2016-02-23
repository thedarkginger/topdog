class MyTdController < ApplicationController

def index
	@participations = Participation.where(user_id: current_user.id).where("score > 0").order(score: :desc)
	@reservations = Reservation.where(user_id: current_user.id) && Quiz.where("game_start > ?", Time.now).order(game_start: :asc)
end
end

