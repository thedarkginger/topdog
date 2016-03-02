class CreateAnswers < ActiveRecord::Migration
  def change
  	 create_table :answers do |t|
      t.belongs_to :question, index: true
      t.string :answer_text, :null => false
      t.boolean :correct_answer, :null => false, :default => false

      t.timestamps
    end
  end
end
