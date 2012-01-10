class RemovePicturePathFromPlace < ActiveRecord::Migration
  def self.up
		remove_column :places, :picture_path
  end

  def self.down
		add_column :paces, :picture_path, :string
  end
end
