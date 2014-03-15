require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
end

test "should get new" do
    get :new
    assert_response :success
end

test "should create restaurant" do
  assert_difference('Restaurant.count') do
    post :create, restaurant: {name: 'Some name'}
  end
 
  assert_redirected_to post_path(assigns(:restaurant))
end

test "should edit" do
end

test "should update" do
end

end

# Create a controller test for the Index, New, Create, Edit, Update actions
