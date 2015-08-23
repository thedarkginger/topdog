json.array!(@sports1s) do |sports1|
  json.extract! sports1, :id, :question, :answers, :correcta, :quizdate
  json.url sports1_url(sports1, format: :json)
end
