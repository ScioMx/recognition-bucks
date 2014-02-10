require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:fake_user)
    session[:user_id] = @user.id
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
                      name: "some name",
                      password: "scio123",
                      password_confirmation: "scio123"
                    }
    end

    assert_equal "User was successfully created.", flash[:notice]
    assert_redirected_to user_path(assigns(:user))
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
    patch :update, id: @user, user: { email: @user.email, name: @user.name }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
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
