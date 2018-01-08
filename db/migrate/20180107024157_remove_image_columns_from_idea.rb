class RemoveImageColumnsFromIdea < ActiveRecord::Migration[5.1]
  def change
    remove_column :ideas, :image_file_name
    remove_column :ideas, :image_content_type
    remove_column :ideas, :image_file_size
    remove_column :ideas, :image_updated_at
  end
end
