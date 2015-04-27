require 'test_helper'

class ChildLaboursControllerTest < ActionController::TestCase
  setup do
    @child_labour = child_labours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:child_labours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create child_labour" do
    assert_difference('ChildLabour.count') do
      post :create, child_labour: { address: @child_labour.address, age: @child_labour.age, description: @child_labour.description, employer_id: @child_labour.employer_id, father_name: @child_labour.father_name, is_deleted: @child_labour.is_deleted, mother_name: @child_labour.mother_name, name: @child_labour.name, raid_id: @child_labour.raid_id }
    end

    assert_redirected_to child_labour_path(assigns(:child_labour))
  end

  test "should show child_labour" do
    get :show, id: @child_labour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @child_labour
    assert_response :success
  end

  test "should update child_labour" do
    patch :update, id: @child_labour, child_labour: { address: @child_labour.address, age: @child_labour.age, description: @child_labour.description, employer_id: @child_labour.employer_id, father_name: @child_labour.father_name, is_deleted: @child_labour.is_deleted, mother_name: @child_labour.mother_name, name: @child_labour.name, raid_id: @child_labour.raid_id }
    assert_redirected_to child_labour_path(assigns(:child_labour))
  end

  test "should destroy child_labour" do
    assert_difference('ChildLabour.count', -1) do
      delete :destroy, id: @child_labour
    end

    assert_redirected_to child_labours_path
  end
end
