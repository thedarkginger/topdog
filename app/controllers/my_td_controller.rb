class MyTdController < ApplicationController

def index
	# @participations = Participation.where(user_id: current_user.id).where("score > 0").order(score: :desc)
	@participations = Participation.where(user_id: current_user.id).exists? && Game.where("starts_at > ?", Time.now)
end
end

