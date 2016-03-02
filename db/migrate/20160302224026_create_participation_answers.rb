class CreateParticipationAnswers < ActiveRecord::Migration
  def change
     create_table :participation_answers do |t|
      t.references :participation, index: true
      t.references :answer, index: true      

      t.timestamps
    end
  end
end
