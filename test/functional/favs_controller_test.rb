require 'test_helper'

class FavsControllerTest < ActionController::TestCase
  setup do
    @fav = favs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fav" do
    assert_difference('Fav.count') do
      post :create, fav: @fav.attributes
    end

    assert_redirected_to fav_path(assigns(:fav))
  end

  test "should show fav" do
    get :show, id: @fav.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fav.to_param
    assert_response :success
  end

  test "should update fav" do
    put :update, id: @fav.to_param, fav: @fav.attributes
    assert_redirected_to fav_path(assigns(:fav))
  end

  test "should destroy fav" do
    assert_difference('Fav.count', -1) do
      delete :destroy, id: @fav.to_param
    end

    assert_redirected_to favs_path
  end
end
