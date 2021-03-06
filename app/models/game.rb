class Game < ActiveRecord::Base
  
  has_many :participations
  has_many :users, through: :participations
  has_many :points_allocations
  has_many :rankings
  has_many :stacks
  has_many :reservations
  belongs_to :quiz
  accepts_nested_attributes_for :points_allocations

  delegate :category, to: :quiz

  # add a callback for #set_rankings after game completion

  def self.upcoming
    where("starts_at >= ?", Time.now)
  end

  def self.for_topic(topic)
    quizzes = Quiz.for_topic(topic)
    where("quiz_id in (?)", quizzes.pluck(:id))
  end

  def category_name
    category.name
  end

  def self.for_category(category)
  quizzes = Quiz.for_category(category)
  where("quiz_id in (?)", quizzes.pluck(:id))
end

  def purse
    points_allocations.sum(:points)
  end

  def points_for_place(place)
    PointsAllocation.points_for_place(place)
  end

  

  def participating_user_count
    users.count
  end

  def open_spots_left
    max_players - participating_user_count
  end

  private

    # to run manually from the console: Game.find(id_for_relevant_game).send(:set_rankings)
    # that allows you to call private methods from outside the class

    def set_rankings # needs refactoring
      correct_answer_counts = participations.inject({}) do |r, e|
        correct_count = e.correct_answers.count
        r[e] = correct_count
        r
      end

      sorted_counts = correct_answer_counts.sort_by { |k, v| v }.reverse.to_h

      sorted_counts.each_with_index do |(k, v), i|

        if i == 0
          rank = i + 1
        elsif v == sorted_counts.values[i -1]
          rank = sorted_counts.keys[i -1][:ranking]
        else
          rank = i + 1
        end

        k.update_attributes!(ranking: rank)
      end
    end
end
