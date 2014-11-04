class CreateDemoQuestions < ActiveRecord::Migration
  def change
    create_table :demo_questions do |t|
      t.integer :order
      t.string :question1
      t.string :question2
      t.string :question3
      t.string :question4
      t.string :answer
      t.date :creation

      t.timestamps
    end
  end
end
