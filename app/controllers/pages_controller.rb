class PagesController < ApplicationController
  def home
  end

  def about 
  end

  def legal
  end
  
  def contact
  end

  def triviahub
  end

  def history
  end

  def historytrivia
  end

  def historylobby
  end

  def sports1trivia
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
  
end
