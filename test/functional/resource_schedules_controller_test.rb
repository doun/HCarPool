require 'test_helper'

class ResourceSchedulesControllerTest < ActionController::TestCase
  setup do
    @resource_schedule = resource_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resource_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resource_schedule" do
    assert_difference('ResourceSchedule.count') do
      post :create, resource_schedule: { available: @resource_schedule.available, destination: @resource_schedule.destination, isconfirmed: @resource_schedule.isconfirmed, ishireconfirmed: @resource_schedule.ishireconfirmed, isowner: @resource_schedule.isowner, isreadytohire: @resource_schedule.isreadytohire, routeno: @resource_schedule.routeno, startplace: @resource_schedule.startplace, starttime: @resource_schedule.starttime, userId: @resource_schedule.userId, userResourceId: @resource_schedule.userResourceId }
    end

    assert_redirected_to resource_schedule_path(assigns(:resource_schedule))
  end

  test "should show resource_schedule" do
    get :show, id: @resource_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resource_schedule
    assert_response :success
  end

  test "should update resource_schedule" do
    put :update, id: @resource_schedule, resource_schedule: { available: @resource_schedule.available, destination: @resource_schedule.destination, isconfirmed: @resource_schedule.isconfirmed, ishireconfirmed: @resource_schedule.ishireconfirmed, isowner: @resource_schedule.isowner, isreadytohire: @resource_schedule.isreadytohire, routeno: @resource_schedule.routeno, startplace: @resource_schedule.startplace, starttime: @resource_schedule.starttime, userId: @resource_schedule.userId, userResourceId: @resource_schedule.userResourceId }
    assert_redirected_to resource_schedule_path(assigns(:resource_schedule))
  end

  test "should destroy resource_schedule" do
    assert_difference('ResourceSchedule.count', -1) do
      delete :destroy, id: @resource_schedule
    end

    assert_redirected_to resource_schedules_path
  end
end
