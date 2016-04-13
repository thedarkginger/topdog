class Participation < ActiveRecord::Base

  has_many :participation_answers
  has_many :answers, through: :participation_answers
  belongs_to :user
  belongs_to :game



  def self.reservations
    joins(:game).where("games.starts_at > ?", Time.now) # check joins vs includes again
  end

  def self.for_user(user)
    where(user_id: user.id)
  end

  def self.points_allocations_for(user)
    for_user(user).joins("INNER JOIN points_allocations 
                          ON (points_allocations.game_id = participations.game_id 
                              AND points_allocations.place = participations.ranking)")
  end

  def self.points_for(user)
     points_allocations_for(user).sum("points_allocations.points")
  end 

  def correct_answers
    answers.where(correct_answer: true)
  end

  def self.calculate_ranking(game_id)
      records = Participation.where(game_id: game_id, finished: true).order('score DESC, updated_at ASC')

      records.each_with_index do |record, index|
        puts "rank: #{index + 1}"
        puts record.inspect
        puts record['score']
        puts record['user_id']
        puts record['game_id']
        
        Ranking.create(game_id: game_id, user_id: record['user_id'], game_time: record['updated_at'], ranking: index + 1)
    end
  end


  def self.update_wallet(game_id)
    records = Ranking.where(game_id: game_id)
    first = PointsAllocation.where(game_id: game_id, place: 1).pluck(:points).map(&:to_i).first
    second = PointsAllocation.where(game_id: game_id, place: 2).pluck(:points).map(&:to_i).first
    third = PointsAllocation.where(game_id: game_id, place: 3).pluck(:points).map(&:to_i).first
    fourth = PointsAllocation.where(game_id: game_id, place: 4).pluck(:points).map(&:to_i).first

    records.each do |record|
      puts record.inspect
      puts record['user_id']
    if record.ranking == 1
      Stack.create(user_id: record['user_id'], game_id: game_id, chips: first)
    elsif record.ranking == 2
      Stack.create(user_id: record['user_id'], game_id: game_id, chips: second)
    elsif record.ranking == 3
      Stack.create(user_id: record['user_id'], game_id: game_id, chips: third)
    else

    end
  end
  end 


end
