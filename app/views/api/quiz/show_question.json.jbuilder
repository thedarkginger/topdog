json.extract! @history, :id, :question, :quizdate
json.set! :answers, @history.answers.split(',').map(&:strip)
