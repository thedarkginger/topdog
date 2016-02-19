class ScoreboardController < ApplicationController
  def index

  	 @top_ten = Participation.where(finished: true, category: session[:category]).order(score: :desc).limit(10)
  end


end
