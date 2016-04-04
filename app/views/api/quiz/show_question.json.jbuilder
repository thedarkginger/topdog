json.extract! @current_question, :id, :question_text
json.set! :answers, @current_question.answers.pluck(:answer_text)


