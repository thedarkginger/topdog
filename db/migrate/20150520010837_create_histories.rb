class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :question
      t.string :answers
      t.integer :correcta
      t.date :quizdate

      t.timestamps
    end
  end
end
