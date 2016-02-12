class MyTdController < ApplicationController

def index
	@participations = Participation.where(user_id: current_user.id).order(score: :desc)
end
end
