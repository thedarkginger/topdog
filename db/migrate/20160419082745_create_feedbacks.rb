class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.string :email
      t.datetime :time
      t.string :subject
      t.string :feedback

      t.timestamps
    end
  end
end
