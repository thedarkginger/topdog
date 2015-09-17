class AddCategoryToHistories < ActiveRecord::Migration
  def change
    add_column :histories, :category, :string
  end
end
