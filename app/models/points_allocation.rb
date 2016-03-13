class PointsAllocation < ActiveRecord::Base

  belongs_to :game

  def self.points_for_place(place)
    where(place: place).sum(:points)
  end

end