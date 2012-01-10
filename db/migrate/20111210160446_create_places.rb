class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :name
      t.boolean :active
      t.string :phone_number
      t.string :address
      t.time :opening_time
      t.time :closing_time
      t.string :picture_path
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
