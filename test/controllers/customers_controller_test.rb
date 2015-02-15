require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { dob: @customer.dob, eye_color: @customer.eye_color, first_name: @customer.first_name, hair_color: @customer.hair_color, height: @customer.height, last_name: @customer.last_name, order_id: @customer.order_id, weight: @customer.weight }
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { dob: @customer.dob, eye_color: @customer.eye_color, first_name: @customer.first_name, hair_color: @customer.hair_color, height: @customer.height, last_name: @customer.last_name, order_id: @customer.order_id, weight: @customer.weight }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end
