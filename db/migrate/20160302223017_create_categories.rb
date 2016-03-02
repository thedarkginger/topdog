class CreateCategories < ActiveRecord::Migration
  def change
     create_table :categories do |t|
      t.belongs_to :topic, index: true
      t.string :name, :null => false

      t.timestamps
    end
  end
end
