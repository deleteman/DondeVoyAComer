class CreateWorkingDays < ActiveRecord::Migration
  def self.up
    create_table :working_days do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :working_days
  end
end
