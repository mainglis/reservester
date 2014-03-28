class CreateStarRestaurants < ActiveRecord::Migration
  def change
    create_table :star_restaurants do |t|
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
