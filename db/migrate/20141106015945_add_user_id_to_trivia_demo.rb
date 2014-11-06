class AddUserIdToTriviaDemo < ActiveRecord::Migration
  def change
    add_column :trivia_demos, :user_id, :integer
    add_index :trivia_demos, :user_id
  end
end
