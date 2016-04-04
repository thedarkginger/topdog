class ScoreboardController < ApplicationController
  def index
  	 @participations = Participation.where(finished: true, game_id: session[:game_id]).order(score: :desc).limit(10)
  	@game = Game.find(params[:game_id])
  end


end
