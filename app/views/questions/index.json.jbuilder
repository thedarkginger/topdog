json.array!(@questions) do |question|
  json.extract! question, :id, :question_text, :correct_answer
  json.url question_url(question, format: :json)
end
