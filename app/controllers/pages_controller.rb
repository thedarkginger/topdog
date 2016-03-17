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

  def quizmaker
      @histories = History.where(category: session[:category])
  end

  def reservation
    user_id = current_user.id
    id = params[:id]
  
  if (user_id && !Participation.where(user_id: user_id, id: id).exists?)
    plus = Game.participating_users
    plus = plus + 1
    plus.save
  end
  
  unless Participation.where(user_id: user_id, id: id).exists?
    Participation.create(user_id: user_id, id: id)
  end

  end

  def lobby

    @game = Game.find(params[:id])
    @games = Game.where(id: params[:id])
    @tempgame = Game.where(id: params[:id]).first.starts_at

    #category = Quiz.find_by_name(params[:category])
    #@quizzes = Quiz.for_category(category).where(category_id: session[:category_id])

    #topic = Topic.find_by_name(params[:topic])
    #@games = Game.for_topic(topic).upcoming.order(:starts_at)

    #@games = Game.where(category_name: session[:category])

    #category = Category.find_by_name(params[:category])
    #@quizzes = Game.for_category(category).where((category: params[:category]))
    #@tempquiz = Game.where(category: session[:category]).first.starts_at

    #category = Category.find_by_name(params[:category])
    #@games = Game.for_category(category).upcoming.order(:starts_at)


  #topic = Topic.find_by_name(params[:topic])
    #@games = Game.for_topic(topic).upcoming.order(:starts_at)

  end
  
end
