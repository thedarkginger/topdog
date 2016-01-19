class ScoreboardController < ApplicationController
  def index

  	 @participations = Participation.where(finished: true, category: "history").order(score: :desc)
  	 @participations_history = Participation.where(finished: true, category: "history").order(score: :desc)
  
  end
end
