class AddNameToMedal < ActiveRecord::Migration
  def self.up
    add_column :medals, :name, :string
  end

  def self.down
    remove_column :medals, :name
  end
end
