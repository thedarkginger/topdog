class Quiz < ActiveRecord::Base

  has_many :quiz_questions
  has_many :questions, through: :quiz_questions
  has_many :games
  belongs_to :category

  def self.for_category(category)
    where(category: category)
  end

  def self.for_topic(topic)
    categories = Category.for_topic(topic)
    where("category_id IN (?)", categories.pluck(:id))
  end
end
