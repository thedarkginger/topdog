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
  Delayed::Job.enqueue(ChipsUpdaterJob.new(params[:game_id]), :run_at => 1.minute.from_now) 
  flash[:notice] = "Mailing is being delivered."

  end 



end
