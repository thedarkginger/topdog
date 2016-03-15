json.array!(@games) do |game|
  json.extract! game, :id, :starts_at, :name, :max_players, :entry, :quiz_id
  json.url game_url(game, format: :json)
end
