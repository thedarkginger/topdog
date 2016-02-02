class ScoreboardController < ApplicationController
  def index

  	 @participations = Participation.where(finished: true, category: session[:category]).order(score: :desc)
  	 #@chipzs = Chipz.where(category: session[:category])
  end


end
