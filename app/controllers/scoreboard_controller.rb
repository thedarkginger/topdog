class ScoreboardController < ApplicationController
  def index

  	#! previously      @participations = Participation.where(finished: true).order(score: :desc) to show all scores - now filters for category
  	 @participations = Participation.where(finished: true, category: "history").order(score: :desc)

  	#! can I create use Scoreboard controller to create several separate scoreboards?  
  end
end
