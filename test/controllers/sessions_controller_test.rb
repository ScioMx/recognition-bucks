require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :redirect
  end

  test "Should create new session" do
    post :create, { email: "test@email.com", password: "scio123" }
    assert_not_nil session[:user_id]
    assert_equal "Logged in!", flash[:notice]
    assert_response :redirect
  end

  test "Should destroy session" do
    get :destroy
    assert_nil session[:user_id]
    assert_equal "Logged out!", flash[:notice]
  end

  test "Should fail create new session" do
    post :create, { email: "test@email.com", password: "scio" }
    assert_nil session[:user_id]
    assert_equal "Invalid email or password", flash[:alert]
  end
end
