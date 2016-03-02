class Game < ActiveRecord::Base
  
  has_many :participations
  has_many :users, through: :participations
  belongs_to :quiz

end
