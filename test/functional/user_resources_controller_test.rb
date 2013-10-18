require 'test_helper'

class UserResourcesControllerTest < ActionController::TestCase
  setup do
    @user_resource = user_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_resource" do
    assert_difference('UserResource.count') do
      post :create, user_resource: { acNonac: @user_resource.acNonac, carModel: @user_resource.carModel, carNumber: @user_resource.carNumber, driverName: @user_resource.driverName, imageUrl: @user_resource.imageUrl, isOwned: @user_resource.isOwned, isSelfDrive: @user_resource.isSelfDrive, maxCapacity: @user_resource.maxCapacity }
    end

    assert_redirected_to user_resource_path(assigns(:user_resource))
  end

  test "should show user_resource" do
    get :show, id: @user_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_resource
    assert_response :success
  end

  test "should update user_resource" do
    put :update, id: @user_resource, user_resource: { acNonac: @user_resource.acNonac, carModel: @user_resource.carModel, carNumber: @user_resource.carNumber, driverName: @user_resource.driverName, imageUrl: @user_resource.imageUrl, isOwned: @user_resource.isOwned, isSelfDrive: @user_resource.isSelfDrive, maxCapacity: @user_resource.maxCapacity }
    assert_redirected_to user_resource_path(assigns(:user_resource))
  end

  test "should destroy user_resource" do
    assert_difference('UserResource.count', -1) do
      delete :destroy, id: @user_resource
    end

    assert_redirected_to user_resources_path
  end
end
