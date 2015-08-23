class CreateSports1s < ActiveRecord::Migration
  def change
    create_table :sports1s do |t|
      t.text :question
      t.text :answers
      t.integer :correcta
      t.date :quizdate

      t.timestamps
    end
  end
end
