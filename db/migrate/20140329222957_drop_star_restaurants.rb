class DropStarRestaurants < ActiveRecord::Migration
	  def up
	    drop_table :star_restaurants
	  end

	  def down
	    create_table :stars do |t|
	      t.integer :restaurant_id
	      t.integer :user_id

	      t.timestamps        
	    end
	  end
end
