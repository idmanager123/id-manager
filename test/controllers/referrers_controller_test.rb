require 'test_helper'

class ReferrersControllerTest < ActionController::TestCase
  setup do
    @referrer = referrers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:referrers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create referrer" do
    assert_difference('Referrer.count') do
      post :create, referrer: { name: @referrer.name }
    end

    assert_redirected_to referrer_path(assigns(:referrer))
  end

  test "should show referrer" do
    get :show, id: @referrer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @referrer
    assert_response :success
  end

  test "should update referrer" do
    patch :update, id: @referrer, referrer: { name: @referrer.name }
    assert_redirected_to referrer_path(assigns(:referrer))
  end

  test "should destroy referrer" do
    assert_difference('Referrer.count', -1) do
      delete :destroy, id: @referrer
    end

    assert_redirected_to referrers_path
  end
end
