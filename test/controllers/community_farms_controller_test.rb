require 'test_helper'

class CommunityFarmsControllerTest < ActionController::TestCase
  setup do
    @community_farm = community_farms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:community_farms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create community_farm" do
    assert_difference('CommunityFarm.count') do
      post :create, community_farm: { department_id: @community_farm.department_id, involve_member: @community_farm.involve_member, raid_id: @community_farm.raid_id, string: @community_farm.string }
    end

    assert_redirected_to community_farm_path(assigns(:community_farm))
  end

  test "should show community_farm" do
    get :show, id: @community_farm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @community_farm
    assert_response :success
  end

  test "should update community_farm" do
    patch :update, id: @community_farm, community_farm: { department_id: @community_farm.department_id, involve_member: @community_farm.involve_member, raid_id: @community_farm.raid_id, string: @community_farm.string }
    assert_redirected_to community_farm_path(assigns(:community_farm))
  end

  test "should destroy community_farm" do
    assert_difference('CommunityFarm.count', -1) do
      delete :destroy, id: @community_farm
    end

    assert_redirected_to community_farms_path
  end
end
