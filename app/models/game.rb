class Game < ActiveRecord::Base
  
  has_many :participations
  has_many :users, through: :participations
  has_many :points_allocations
  belongs_to :quiz

end
