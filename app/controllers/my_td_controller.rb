class MyTdController < ApplicationController

def index
	@participations = Participation.where(user_id: current_user.id).where("score > 0").order(score: :desc)
	@reservations = Quiz.where("game_start >= ?", Time.now).order(game_start: :asc).limit(4) and Reservation.where (user_id: current_user.id)
end
end
