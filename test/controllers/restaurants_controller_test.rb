require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
# def Setup
#   @current_user = fixture current user
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


test "should get create" do
    get :create, restaurant: {name: "Piccos", owner_id: "11"}
      # @current_user_id} is the ending if you uncomment the def Setup metnod above
    assert_response :redirect
  end

test "should edit" do
end

test "should update" do
end

end

# Create a controller test for the Index, New, Create, Edit, Update actions
