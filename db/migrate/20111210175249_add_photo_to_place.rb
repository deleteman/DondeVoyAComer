class AddPhotoToPlace < ActiveRecord::Migration
  def self.up
    add_column :places, :photo_file_name, :string
    add_column :places, :photo_content_type, :string
    add_column :places, :photo_file_size, :string
    add_column :places, :photo_updated_at, :string
  end

  def self.down
    remove_column :places, :photo_updated_at
    remove_column :places, :photo_file_size
    remove_column :places, :photo_content_type
    remove_column :places, :photo_file_name
  end
end
