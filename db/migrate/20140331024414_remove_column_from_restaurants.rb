class RemoveColumnFromRestaurants < ActiveRecord::Migration
  def change
  	remove_column :restaurants, :monday_open_at
  end
end
