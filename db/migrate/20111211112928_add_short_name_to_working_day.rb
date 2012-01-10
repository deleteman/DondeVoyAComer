class AddShortNameToWorkingDay < ActiveRecord::Migration
  def self.up
    add_column :working_days, :short_name, :string
  end

  def self.down
    remove_column :working_days, :short_name
  end
end
