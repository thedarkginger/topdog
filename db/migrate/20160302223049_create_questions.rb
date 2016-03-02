class CreateQuestions < ActiveRecord::Migration
  def change
     create_table :questions do |t|
      t.belongs_to :category, index: true
      t.string :question_text, :null => false

      t.timestamps
    end
  end
end
