class AddClosedBoxToRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :monday_closed, :boolean
  	add_column :restaurants, :tuesday_closed, :boolean
  	add_column :restaurants, :wednesday_closed, :boolean
  	add_column :restaurants, :thursday_closed, :boolean
  	add_column :restaurants, :friday_closed, :boolean
  	add_column :restaurants, :saturday_closed, :boolean
  	add_column :restaurants, :sunday_closed, :boolean
  end
end
