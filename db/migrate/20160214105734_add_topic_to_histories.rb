class AddTopicToHistories < ActiveRecord::Migration
  def change
    add_column :histories, :topic, :string
  end
end
