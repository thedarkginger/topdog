class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :topic
      t.date :start_time
      t.integer :entry
      t.integer :prize
      t.string :category

      t.timestamps
    end
  end
end
