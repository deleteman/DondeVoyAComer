class AddCoordinatesToPlace < ActiveRecord::Migration
  def self.up
    add_column :places, :lat, :float
    add_column :places, :lng, :float
  end

  def self.down
    remove_column :places, :lng
    remove_column :places, :lat
  end
end
