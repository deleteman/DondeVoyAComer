class CreateMedals < ActiveRecord::Migration
  def self.up
    create_table :medals do |t|
      t.string :type
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :medals
  end
end
