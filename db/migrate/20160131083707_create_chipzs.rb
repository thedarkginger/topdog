class CreateChipzs < ActiveRecord::Migration
  def change
    create_table :chipzs do |t|
      t.string :category
      t.integer :rank
      t.integer :prize

      t.timestamps
    end
  end
end
