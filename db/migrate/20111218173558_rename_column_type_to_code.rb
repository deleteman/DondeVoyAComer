class RenameColumnTypeToCode < ActiveRecord::Migration
  def self.up
		rename_column :medals, :type, :code
  end

  def self.down
		rename_column :medals, :code, :type
  end
end
