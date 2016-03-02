class CreateGame < ActiveRecord::Migration
  def change
  	 create_table :games do |t|
      t.references :quiz, index: true
      t.datetime :starts_at
      t.string :name
      t.integer :max_players
      t.decimal :entry

      t.timestamps
    end
  end
end
