class AddTimefieldsToRestaurant < ActiveRecord::Migration
  def change 
  	add_column :restaurants, :monday_open_at, :time
  	add_column :restaurants, :monday_close_at, :time
  	add_column :restaurants, :tuesday_open_at, :time
  	add_column :restaurants, :tuesday_close_at, :time
  	add_column :restaurants, :wednesday_open_at, :time
  	add_column :restaurants, :wednesday_close_at, :time
  	add_column :restaurants, :thursday_open_at, :time
  	add_column :restaurants, :thursday_close_at, :time
  	add_column :restaurants, :friday_open_at, :time
  	add_column :restaurants, :friday_close_at, :time
  	add_column :restaurants, :saturday_open_at, :time
  	add_column :restaurants, :saturday_close_at, :time
  	add_column :restaurants, :sunday_open_at, :time
  	add_column :restaurants, :sunday_close_at, :time

  	add_index :restaurants, :monday_open_at
  	add_index :restaurants, :monday_close_at
  	add_index :restaurants, :tuesday_open_at
  	add_index :restaurants, :tuesday_close_at
  	add_index :restaurants, :wednesday_open_at
  	add_index :restaurants, :wednesday_close_at
  	add_index :restaurants, :thursday_open_at
  	add_index :restaurants, :thursday_close_at
  	add_index :restaurants, :friday_open_at
  	add_index :restaurants, :friday_close_at
  	add_index :restaurants, :saturday_open_at
  	add_index :restaurants, :saturday_close_at
  	add_index :restaurants, :sunday_open_at
  	add_index :restaurants, :sunday_close_at

  	add_column :restaurants, :max_reservations, :integer
  end
end
