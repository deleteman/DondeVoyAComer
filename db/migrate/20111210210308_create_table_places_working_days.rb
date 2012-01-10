class CreateTablePlacesWorkingDays < ActiveRecord::Migration
  def self.up
		create_table :places_working_days, :id => false do |t|
			t.integer :place_id
			t.integer :working_day_id
		end
  end

  def self.down
		drop_table :places_working_days	
  end
end
