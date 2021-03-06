require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get help" do
    get :home
    assert_response :success
  end
  
  test "should get about" do
    get :home
    assert_response :success
  end
end
