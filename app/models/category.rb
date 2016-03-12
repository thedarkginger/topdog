class Category < ActiveRecord::Base
  
  has_many :questions
  has_many :quizzes
  belongs_to :topic

  def self.for_topic(topic)
    where(topic_id: topic)
  end 

end