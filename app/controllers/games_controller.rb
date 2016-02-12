class GamesController < ApplicationController
	def index
		@quizzes = Quiz.where("game_start >= ?", Time.now).where(topic: params[:topic]).order(game_start: :asc)
	end
end