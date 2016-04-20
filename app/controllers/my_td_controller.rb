class MyTdController < ApplicationController

def index
	if Reservation.where(user_id: current_user.id).exists? 
		@others = Game.where("starts_at > ?", Time.now)
	else 
	end

	
end
end

