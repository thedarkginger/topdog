json.array!(@answers) do |answer|
  json.extract! answer, :id, :answer_text, :correct_answer
  json.url answer_url(answer, format: :json)
end
