class AddColumnToStars < ActiveRecord::Migration
  def change
  	add_column :stars, :user_id, :integer
  	add_column :stars, :restaurant_id, :integer
  end
end
