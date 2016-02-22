class MyTdController < ApplicationController

def index
	@participations = Participation.where(user_id: current_user.id).where("score > 0").order(score: :desc)
	@reservations = Reservation.where(user_id: current_user.id)
end
end

