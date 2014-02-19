require 'test_helper'

class BucksControllerTest < ActionController::TestCase
  setup do
    @buck = bucks(:one)
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
  end

  test "should destroy buck" do
    assert_difference('Buck.count', -1) do
      delete :destroy, id: @buck
    end

    assert_redirected_to bucks_path
  end
end
