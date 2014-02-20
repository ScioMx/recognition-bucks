require 'test_helper'

class BucksControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @buck = bucks(:fake_buck_one)
    @user = users(:fake_user)
    sign_in :user, @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bucks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create buck" do
    assert_difference('Buck.count') do
      post :create, buck: { description: @buck.description, goes_to: @buck.goes_to, status: @buck.status, value: @buck.value }
    end

    assert_redirected_to buck_path(assigns(:buck))
    assert_equal  'Buck was successfully created.', flash[:notice] 
  end

  test "should stay in the page if create fails" do
    assert_difference('Buck.count', 0) do
      post :create, buck: { description: "", goes_to: "", status: @buck.status, value: @buck.value }
    end

    assert_template(:new)
    assert_equal 'Buck was not successfully created.', flash[:error] 
  end

  test "should show buck" do
    get :show, id: @buck
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @buck
    assert_response :success
  end

  test "should update buck" do
    patch :update, id: @buck, buck: { description: @buck.description, goes_to: @buck.goes_to, status: @buck.status, value: @buck.value }
    assert_redirected_to buck_path(assigns(:buck))
    assert_equal  'Buck was successfully updated.', flash[:notice] 
  end

  test "should stay in the page if update fails" do
    patch :update, id: @buck, buck: { description: "", goes_to: "", status: @buck.status, value: @buck.value }
    assert_template(:edit)
    assert_equal  'Buck was not successfully updated.', flash[:error] 
  end

  test "should destroy buck" do
    assert_difference('Buck.count', -1) do
      delete :destroy, id: @buck
    end

    assert_redirected_to bucks_path
  end
end
