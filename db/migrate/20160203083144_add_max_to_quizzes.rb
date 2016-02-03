class AddMaxToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :max, :integer
  end
end
