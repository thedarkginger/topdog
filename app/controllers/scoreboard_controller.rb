class ScoreboardController < ApplicationController
  def index
  	@participations = Participation.where(finished: true, game_id: session[:game_id]).order(score: :desc).limit(10)
  	@game = Game.find(params[:game_id])
    @firstpoints = PointsAllocation.where(game_id: params[:game_id]).where(place: "1").pluck(:points).map(&:to_i).first
    @secondpoints = PointsAllocation.where(game_id: params[:game_id]).where(place: "2").pluck(:points).map(&:to_i).first
    @thirdpoints = PointsAllocation.where(game_id: params[:game_id]).where(place: "3").pluck(:points).map(&:to_i).first    

  	a = Participation.where(user_id: current_user.id).last.score
  	b = Participation.where(user_id: current_user.id).last.id
  	scores = Participation.where(game_id: params[:game_id]).where("score > ?", a).count

  	if scores == 0 
  		Participation.update(b, :ranking => 1)
  	else 
  		Participation.update(b, :ranking => scores + 1)
  	end

    if Participation.where(ranking: "1")
      first = PointsAllocation.where(game_id: params[:game_id]).where(place: "1").pluck(:points).map(&:to_i).first
      Stack.create(game_id: params[:game_id], user_id: current_user.id, chips: first)
    elsif Participation.where(ranking: "2")
      second = PointsAllocation.where(game_id: params[:game_id]).where(place: "2").pluck(:points).map(&:to_i).first
      Stack.create(game_id: params[:game_id], user_id: current_user.id, chips: second)
    else

    end 
  	
  end


end
