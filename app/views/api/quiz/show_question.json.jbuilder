json.extract! @current_question, :id, :question, :quizdate
json.set! :answers, @current_question.answers.split(',').map(&:strip)
