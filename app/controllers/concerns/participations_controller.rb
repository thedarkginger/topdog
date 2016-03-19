class ParticipationsController < ApplicationController
​
  def create
    game = Game.find(params[:id]) # or :game_id depending on how the params are structured
    
    unless game.participating_users.include?(current_user)
      game.users << current_user
    end
  end
​
end