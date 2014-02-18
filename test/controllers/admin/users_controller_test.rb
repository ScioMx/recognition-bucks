require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    @user = User.first
    sign_in :user, @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { 
                      email: "test2@email.com", 
                      password: "scio1234",
                      password_confirmation: "scio1234"
                    }
    end

    assert_equal "User was successfully created.", flash[:notice]
    assert_redirected_to admin_users_path
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: {email: "update@email.com"}
    assert_redirected_to admin_users_path
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to admin_users_path
  end

  test "Should not create user if has incorrect email format" do
    user = User.new()
    user.name = "test name"
    user.email = "test incorrect email"
    assert_difference 'User.count', 0 do
      assert !user.save() 
    end
  end

  test "Should not update user if has incorrect email format" do
    @user.name = "test name"
    @user.email = "test incorrect email"
    assert !@user.save
  end

end
