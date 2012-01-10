class CreateActions < ActiveRecord::Migration
  def self.up
    create_table :actions do |t|
      t.integer :owner_user_id
      t.text :description
      t.integer :associated_points

      t.timestamps
    end
  end

  def self.down
    drop_table :actions
  end
end
