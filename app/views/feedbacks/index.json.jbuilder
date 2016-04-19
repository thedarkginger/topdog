json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :user_id, :email, :time, :subject, :feedback
  json.url feedback_url(feedback, format: :json)
end
