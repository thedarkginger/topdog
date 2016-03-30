class Question < ActiveRecord::Base

   has_many :quiz_questions
   has_many :quizzes, through: :quiz_questions
   has_many :answers
   belongs_to :category
   accepts_nested_attributes_for :answers

  end