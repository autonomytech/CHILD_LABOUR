require 'test_helper'

class ComplaintsControllerTest < ActionController::TestCase
  setup do
    @complaint = complaints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:complaints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create complaint" do
    assert_difference('Complaint.count') do
      post :create, complaint: { area: @complaint.area, contact_no: @complaint.contact_no, description: @complaint.description, email: @complaint.email, first_name: @complaint.first_name, last_name: @complaint.last_name, last_seen_date: @complaint.last_seen_date, middle_name: @complaint.middle_name, subject: @complaint.subject }
    end

    assert_redirected_to complaint_path(assigns(:complaint))
  end

  test "should show complaint" do
    get :show, id: @complaint
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @complaint
    assert_response :success
  end

  test "should update complaint" do
    patch :update, id: @complaint, complaint: { area: @complaint.area, contact_no: @complaint.contact_no, description: @complaint.description, email: @complaint.email, first_name: @complaint.first_name, last_name: @complaint.last_name, last_seen_date: @complaint.last_seen_date, middle_name: @complaint.middle_name, subject: @complaint.subject }
    assert_redirected_to complaint_path(assigns(:complaint))
  end

  test "should destroy complaint" do
    assert_difference('Complaint.count', -1) do
      delete :destroy, id: @complaint
    end

    assert_redirected_to complaints_path
  end
end
