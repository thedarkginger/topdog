class Answer
  
  has_many :participation_answers
  has_many :participations, through: :participation_answers
  belongs_to :question # originally thought hmt but reusing answers doesn't seem to have much (if any) benefit

end