require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  test "#index should return all restaurants" do
    (1..10).each do |i|
      Restaurant.create name: "Restaurant #{i}"
    end

    get :index

    assert_response :success
    assert_equal 10, assigns(:restaurants).count
  end

  test "#show should display a restaurant" do
    restaurant = Restaurant.create name: 'McDonalds Fine Dining', description: 'Fine American cuisine', phone: '555 555 5555', address: '123 Fake St Boston, MA 02114'

    get :show, id: restaurant.id

    assert_response :success
    assert_equal restaurant, assigns(:restaurant)
  end

  test "#new should display a blank, unsaved restaurant" do
    get :new

    assert_response :success
    restaurant = assigns :restaurant

    assert not(restaurant.persisted?)
  end

  test "#create should save a Restaurant" do
    name = 'Casa de Pasta' 
    description = 'Italian food... kinda'
    phone = '555 666 7777'
    address = '456 Fake St Boston, MA 02114'

    assert_difference('Restaurant.count') do
      post :create, restaurant: { name: name, description: description, phone: phone, address: address }
    end

    restaurant = assigns :restaurant

    assert_equal name, restaurant.name
    assert_equal description, restaurant.description
    assert_equal phone, restaurant.phone
    assert_equal address, restaurant.address
  end

  test "#edit should display the restaurant" do
    restaurant = Restaurant.create name: 'McDonalds Fine Dining', description: 'Fine American cuisine', phone: '555 555 5555', address: '123 Fake St Boston, MA 02114'

    get :edit, id: restaurant.id

    assert_response :success
    restaurant = assigns :restaurant
  end

  test "#update should update a Restaurant" do
    existing_restaurant = Restaurant.create name: 'McDonalds Fine Dining', description: 'Fine American cuisine'

    new_name = 'Chuck E Cheese'
    new_description = 'Where a kid can be a kid'

    put :update, id: existing_restaurant.id, restaurant: { name: new_name, description: new_description }

    found_restaurant = assigns :restaurant

    assert_equal new_name, found_restaurant.name
    assert_equal new_description, found_restaurant.description
    assert_equal existing_restaurant.phone, found_restaurant.phone
    assert_equal existing_restaurant.address, found_restaurant.address
  end
end
