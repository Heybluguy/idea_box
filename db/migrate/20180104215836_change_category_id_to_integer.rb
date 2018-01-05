class ChangeCategoryIdToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :ideas, :category_id, :integer
  end
end
