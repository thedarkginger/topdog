class CreateTriviaDemos < ActiveRecord::Migration
  def change
    create_table :trivia_demos do |t|
      t.integer :order
      t.string :question
      t.string :answer1
      t.string :answer2
      t.string :answer3
      t.string :answer4
      t.string :correcta
      t.date :published

      t.timestamps
    end
  end
end
