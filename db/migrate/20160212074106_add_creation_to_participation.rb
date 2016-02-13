class AddCreationToParticipation < ActiveRecord::Migration
  def change
    add_column :participations, :create, :datetime
  end
end
