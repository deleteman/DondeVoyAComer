class AddCodeToAction < ActiveRecord::Migration
  def self.up
    add_column :actions, :code, :string
  end

  def self.down
    remove_column :actions, :code
  end
end
