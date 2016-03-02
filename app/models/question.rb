class Question
  
  has_many :quiz_questions
  has_many :quizzes, through: :quiz_questions
  has_many :answers
  belongs_to :category

end