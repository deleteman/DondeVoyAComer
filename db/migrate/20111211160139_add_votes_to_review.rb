class AddVotesToReview < ActiveRecord::Migration
  def self.up
    add_column :reviews, :votes, :integer
  end

  def self.down
    remove_column :reviews, :votes
  end
end
