class ScoreboardController < ApplicationController
  def index
    @participations = Participation.where(finished: true).order(score: :desc)
  end
end
