class ScoreboardController < ApplicationController
  def index

  	 @participations = Participation.where(finished: true, category: session[:category]).order(score: :desc)
  	 @participations_history = Participation.where(category: session[:category]).order(score: :desc)
  
  end
end
