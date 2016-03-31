class PagesController < ApplicationController
  def home
    @games = Game.where("starts_at >= ?", Time.now).order(starts_at: :desc).limit(5)
  end

  def testhome
  end

  def about 
  end

  def legal
  end
  
  def contact
  end

  def triviahub
  end

  def testhome
    @questions = Question.all
    @answers = Answer.all
  end

  def reservation
    user_id = current_user.id
      Participation.create(user_id: user_id, game_id: params[:id])
  
  end

  def lobby
    @game = Game.find(params[:id])
    @games = Game.where(id: params[:id])
    @tempgame = Game.where(id: params[:id]).first.starts_at

  end

  def trivia 
    @game = Game.find(params[:id])
  end
  
end
