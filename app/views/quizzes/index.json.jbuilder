json.array!(@quizzes) do |quiz|
  json.extract! quiz, :id, :topic, :category, :topic, :game_start, :entry, :purse, :first, :second, :third, :fourth
  json.url quiz_url(quiz, format: :json)
end
