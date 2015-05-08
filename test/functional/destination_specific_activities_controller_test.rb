require 'test_helper'

class DestinationSpecificActivitiesControllerTest < ActionController::TestCase
  setup do
    @destination_specific_activity = destination_specific_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:destination_specific_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create destination_specific_activity" do
    assert_difference('DestinationSpecificActivity.count') do
      post :create, destination_specific_activity: { end_date: @destination_specific_activity.end_date, start_date: @destination_specific_activity.start_date }
    end

    assert_redirected_to destination_specific_activity_path(assigns(:destination_specific_activity))
  end

  test "should show destination_specific_activity" do
    get :show, id: @destination_specific_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @destination_specific_activity
    assert_response :success
  end

  test "should update destination_specific_activity" do
    put :update, id: @destination_specific_activity, destination_specific_activity: { end_date: @destination_specific_activity.end_date, start_date: @destination_specific_activity.start_date }
    assert_redirected_to destination_specific_activity_path(assigns(:destination_specific_activity))
  end

  test "should destroy destination_specific_activity" do
    assert_difference('DestinationSpecificActivity.count', -1) do
      delete :destroy, id: @destination_specific_activity
    end

    assert_redirected_to destination_specific_activities_path
  end
end
