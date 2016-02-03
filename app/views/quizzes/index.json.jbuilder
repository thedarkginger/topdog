json.array!(@quizzes) do |quiz|
  json.extract! quiz, :id, :topic, :category, :topic, :game_start, :entry, :purse, :first, :second, :third, :fourth, :max
  json.url quiz_url(quiz, format: :json)
end
