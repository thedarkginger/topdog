json.array!(@trivia_demos) do |trivia_demo|
  json.extract! trivia_demo, :id, :order, :question, :answer1, :answer2, :answer3, :answer4, :correcta, :published
  json.url trivia_demo_url(trivia_demo, format: :json)
end
