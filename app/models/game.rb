class Game < ActiveRecord::Base
  
  has_many :participations
  has_many :users, through: :participations
  has_many :points_allocations
  belongs_to :quiz

  # add a callback for #set_rankings after game completion

  def purse
    points_allocations.sum(:points)
  end

  private

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
