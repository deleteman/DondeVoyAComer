class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :owner_user_id
      t.integer :points
      t.string :body

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
