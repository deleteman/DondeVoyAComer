class CreateUserMedals < ActiveRecord::Migration
  def self.up
    create_table :user_medals do |t|
      t.integer :user_id
      t.integer :medal_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_medals
  end
end
