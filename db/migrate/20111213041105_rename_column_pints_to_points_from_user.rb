class RenameColumnPintsToPointsFromUser < ActiveRecord::Migration
  def self.up
		change_column :users, :pints, :points
  end

  def self.down
		change_column :users, :points, :pints
  end
end
