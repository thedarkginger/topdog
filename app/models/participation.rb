class Participation < ActiveRecord::Base

  has_many :participation_answers
  has_many :answers, through: :participation_answers
  belongs_to :user
  belongs_to :game

  def self.get_number_of_user_for(category)
    Participation.where(category: category).where('created_at >= ?', Date.today).pluck(:user_id).uniq.count
  end

   def self.number_of_spots_for(category)
    Participation.where(category: category).where('created_at >= ?', Date.today).pluck(:user_id).uniq.count
  end

  # quick test logic

  # def self.for_user(user)
  #   where(user_id: user.id)
  # end

  # def self.points_allocations_for(user)
  #   for_user(user).joins(:points_allocations).where("game_id = ? AND place = ?", game_id, ranking)
  # end

  # def self.points_for(user)
  #    points_allocations_for(user).sum(:points)
  # end 




end
