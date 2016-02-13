class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.references :user
      t.string :category
      t.boolean :finished, default: false
      t.integer :current_question_index, default: 0
      t.integer :score, default: 0

      t.timestamps 
    end
  end
end
