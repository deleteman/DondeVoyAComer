class AddHighlitedFoodToPlace < ActiveRecord::Migration
  def self.up
    add_column :places, :highlited_food, :string
  end

  def self.down
    remove_column :places, :highlited_food
  end
end
