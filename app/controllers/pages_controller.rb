class PagesController < ApplicationController
  def home
    @games = Game.where("starts_at >= ?", Time.now).order(starts_at: :asc).limit(5)
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

  def stack
    @stack = Stack.where(user_id: current_user.id)
    @total = @stack.sum(:chips)
    @final = @total.to_i
  end 

  def testhome
    @questions = Question.all
    @answers = Answer.all
  end

  def reservation
    user_id = current_user.id
    Reservation.create(user_id: user_id, game_id: params[:id])

    entry = Game.where(id: params[:id]).pluck(:entry).map(&:to_i).first
    entryfix = (entry * -1)

    Stack.create(user_id: user_id, game_id: params[:id], chips: entryfix)
  
  end

  def lobby
    @game = Game.find(params[:id])
    @games = Game.where(id: params[:id])
    @tempgame = Game.where(id: params[:id]).first.starts_at

  end

  def trivia 
    @game = Game.find(params[:game_id])

  end
  
end
