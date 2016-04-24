class ScoreboardController < ApplicationController
  def index

    # instance variable for the view, ignore 
  	@participations = Participation.where(finished: true, game_id: session[:game_id]).where("score > ?", 0).order(score: :desc).limit(10)
  	@game = Game.where(id: params[:game_id])
    @firstpoints = PointsAllocation.where(game_id: params[:game_id]).where(place: "1").pluck(:points).map(&:to_i).first
    @secondpoints = PointsAllocation.where(game_id: params[:game_id]).where(place: "2").pluck(:points).map(&:to_i).first
    @thirdpoints = PointsAllocation.where(game_id: params[:game_id]).where(place: "3").pluck(:points).map(&:to_i).first 

    unless Ranking.where(game_id: params[:game_id]).present?
        Delayed::Job.enqueue(ChipsUpdaterJob.new(@game.first.id), :run_at => @game.first.starts_at + 13.minutes)
    end 

end

end
