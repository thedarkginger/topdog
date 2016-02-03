class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :topic
      t.string :category
      t.datetime :game_start
      t.integer :entry
      t.integer :purse
      t.integer :first
      t.integer :second
      t.integer :third
      t.integer :fourth

      t.timestamps
    end
  end
end
