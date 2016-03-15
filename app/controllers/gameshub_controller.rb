class GameshubController < ApplicationController
	def index
    topic = Topic.find_by_name(params[:topic])
    @games = Game.for_topic(topic).upcoming.order(:starts_at)
	end
end