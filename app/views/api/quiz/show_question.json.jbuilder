json.extract! @current_question, :id, :question
json.set! :answers, @current_question.answers.split(',').map(&:strip)
