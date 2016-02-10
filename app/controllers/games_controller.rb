class GamesController < ApplicationController
	def index
		@quizzes = Quiz.where("game_start >= ?", Time.now).where(topic: params[:topic])
	end
end