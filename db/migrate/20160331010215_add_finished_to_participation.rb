class AddFinishedToParticipation < ActiveRecord::Migration
  def change
    add_column :participations, :finished, :boolean, default: false
    add_column :participations, :current_question_index, :integer, default: 0
    add_column :participations, :score, :integer, default: 0
  end
end
