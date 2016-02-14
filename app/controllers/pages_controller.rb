class PagesController < ApplicationController
  def home
     @quizzes = Quiz.where("game_start >= ?", Time.now).order(game_start: :asc).limit(4)
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
  end
  
end
