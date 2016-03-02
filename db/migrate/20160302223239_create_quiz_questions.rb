class CreateQuizQuestions < ActiveRecord::Migration
  def change
      create_table :quiz_questions do |t|
	      t.belongs_to :quiz, index: true
	      t.belongs_to :question, index: true

	      t.timestamps
    end
  end
end
