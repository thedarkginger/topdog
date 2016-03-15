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

  def quizmaker
      @histories = History.where(category: session[:category])
  end

  def reservation
    user_id = current_user.id
    category = params[:category]
  
  if (user_id && !Reservation.where(user_id: user_id, category: category).exists?)
    sp = SpotCounter.where(category: category).first
    # sp.user_id = user_id
    sp.count = sp.count + 1
    sp.save
  end
  
  unless Reservation.where(user_id: user_id, category: category).exists?
    Reservation.create(user_id: user_id, category: category)
  end

  end

  def lobby
    @quizzes = Quiz.where(category: params[:category])
    @tempquiz = Quiz.where(category: session[:category]).first.game_start
  end
  
end
