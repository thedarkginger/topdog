class ScoreboardController < ApplicationController
  def index
  	 @participations = Participation.where(finished: true, category: session[:category]).order(score: :desc).limit(10)
  	 @quizzes = Quiz.where(category: params[:category])
  end


end
