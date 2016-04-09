class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :chips, default: 0
    end
  end
end
