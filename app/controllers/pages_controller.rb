class PagesController < ApplicationController
  def home
    @games = Game.where("starts_at >= ?", Time.now - 2.minutes).order(starts_at: :asc).limit(5)
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
    @stack = Stack.where(user_id: current_user.id).order(game_id: :desc).limit(10)
    @total = @stack.sum(:chips)
    @final = @total.to_i

  end 

  def beta 

    first = Stack.group(:user_id).sum(:chips)
    @stacks = first.sort {|a,b| a[1] <=> b[1]}.reverse
  
  end

  def testhome
    @questions = Question.all
    @answers = Answer.all
  end

  def reservation
    user_id = current_user.id
  
    entry = Game.where(id: params[:id]).pluck(:entry).map(&:to_i).first
    @entryfix = (entry * -1)
    @total = Stack.where(user_id: current_user.id).sum(:chips)

    if @total > @entryfix 
        Stack.create(user_id: user_id, game_id: params[:id], chips: @entryfix)
        Reservation.create(user_id: user_id, game_id: params[:id])
    else
    end
  
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

