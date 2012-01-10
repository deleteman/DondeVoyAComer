class CreateUserVotes < ActiveRecord::Migration
  def self.up
    create_table :user_votes do |t|
      t.integer :user_id
      t.integer :review_id
      t.integer :vote

      t.timestamps
    end
  end

  def self.down
    drop_table :user_votes
  end
end
