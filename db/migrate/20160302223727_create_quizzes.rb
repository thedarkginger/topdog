class CreateQuizzes < ActiveRecord::Migration
  def change
     create_table :quizzes do |t|
      t.belongs_to :category, index: true
      t.string :name, :null => false

      t.timestamps
    end
  end
end
