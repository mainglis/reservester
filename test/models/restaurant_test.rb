require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
test "should not save your restaurant without a name" do
  restaurant = Restaurant.new
  assert !restaurant.save, "Saved the restaurant without a name"
end

end

