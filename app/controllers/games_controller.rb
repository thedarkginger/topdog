class GamesController < ApplicationController
	def index
		@quizzes = Quiz.where(topic: params[:topic])
	end
end