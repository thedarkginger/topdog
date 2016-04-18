class ScoreboardController < ApplicationController
  def index

    # instance variable for the view, ignore 
  	@participations = Participation.where(finished: true, game_id: session[:game_id]).order(score: :desc).limit(10)
  	@game = Game.find(params[:game_id])
    @firstpoints = PointsAllocation.where(game_id: params[:game_id]).where(place: "1").pluck(:points).map(&:to_i).first
    @secondpoints = PointsAllocation.where(game_id: params[:game_id]).where(place: "2").pluck(:points).map(&:to_i).first
    @thirdpoints = PointsAllocation.where(game_id: params[:game_id]).where(place: "3").pluck(:points).map(&:to_i).first   

end

def chipsupdater
  @game = Game.find(params[:game_id])
  Delayed::Job.enqueue(ChipsUpdaterJob.new(@game.id), 1, :run_at => @game.starts_at + 1.min) 
 
  end 

end
