class ScoreboardController < ApplicationController
  def index
  	@participations = Participation.where(finished: true, game_id: session[:game_id]).order(score: :desc).limit(10)
  	@game = Game.find(params[:game_id])

  	a = Participation.where(user_id: current_user.id).last.score
  	b = Participation.where(user_id: current_user.id).last.id
  	scores = Participation.where(game_id: params[:game_id]).where("score > ?", a).count
  	Participation.update(b, :ranking => scores)
  	
  end


end
