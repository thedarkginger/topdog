class Participation < ActiveRecord::Base
  belongs_to :user

  def self.get_number_of_user_for(category)
  	Participation.where(category: category).where('created_at >= ?', Date.today).pluck(:user_id).uniq.count
  end

   def self.number_of_spots_for(category)
  	Participation.where(category: category).where('created_at >= ?', Date.today).pluck(:user_id).uniq.count
  end

end
