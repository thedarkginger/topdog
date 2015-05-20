json.array!(@histories) do |history|
  json.extract! history, :id, :question, :answers, :correcta, :quizdate
  json.url history_url(history, format: :json)
end
