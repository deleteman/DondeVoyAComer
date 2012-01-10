class AddAttributesToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :fullname, :string
    add_column :users, :pints, :integer
    add_column :users, :rank, :string
  end

  def self.down
    remove_column :users, :rank
    remove_column :users, :pints
    remove_column :users, :fullname
  end
end
