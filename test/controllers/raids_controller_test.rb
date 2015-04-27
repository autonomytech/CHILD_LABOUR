require 'test_helper'

class RaidsControllerTest < ActionController::TestCase
  setup do
    @raid = raids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:raids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create raid" do
    assert_difference('Raid.count') do
      post :create, raid: { date: @raid.date, location_id: @raid.location_id, time: @raid.time, title: @raid.title }
    end

    assert_redirected_to raid_path(assigns(:raid))
  end

  test "should show raid" do
    get :show, id: @raid
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @raid
    assert_response :success
  end

  test "should update raid" do
    patch :update, id: @raid, raid: { date: @raid.date, location_id: @raid.location_id, time: @raid.time, title: @raid.title }
    assert_redirected_to raid_path(assigns(:raid))
  end

  test "should destroy raid" do
    assert_difference('Raid.count', -1) do
      delete :destroy, id: @raid
    end

    assert_redirected_to raids_path
  end
end
