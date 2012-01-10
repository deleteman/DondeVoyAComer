class RenameColumnPintsToPoints < ActiveRecord::Migration
  def self.up
		rename_column :users, :pints, :points
  end

  def self.down
		rename_column :users, :points, :pints
  end
end
