class ScoreboardController < ApplicationController
  def index

  	 @participations = Participation.where(finished: true, category: "history").order(score: :desc)
  	 @participations_history = Participation.where(finished: true, category: "history").order(score: :desc)
  
  	#! can I create use Scoreboard controller to create several separate scoreboards?  
  end
end
