
class ChipsUpdaterJob < Struct.new(:game_id)
  def perform
  	Participation.calculate_ranking(game_id)
  	Participation.update_wallet(game_id)
  end
end