require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not create user if it has an empty property" do
    user = User.new
    assert !user.save	
    assert_equal "Email can't be blank", user.errors.full_messages[0]
    user.email = "some@email.com"
    assert !user.save	
    assert_equal "Password can't be blank", user.errors.full_messages[0]
  end

  test "should not create user if it has an invalid email" do
    user = User.new
    user.email = "te_st&invalidemail.com"	
    assert !user.save
    assert_equal "Email is invalid", user.errors.full_messages[0]
  end

  test "should create new user" do
    user = User.new
    user.email = "te_st@email.com"	
    user.password = "scio1234"
    assert user.save
  end

  test "should not update user if it has an empty property" do
    user = users(:fake_user)
    assert_not user.update({:name => "test name", :email => ""})
    assert_equal "Email can't be blank", user.errors.full_messages[0]
  end

  test "should not update user if it has an invalid email" do
    user = users(:fake_user)
    assert_not user.update({:name => "test name", :email => "te_st&invalidemail.com"})
    assert_equal "Email is invalid", user.errors.full_messages[0]
  end

  test "should update user" do
    user = users(:fake_user)
    assert user.update({:name => "test name", :email => "te_st@email.com"})
  end

  test "Should delete the given user" do
    user = users(:fake_user)

    assert_difference("User.count", -1) do
      user.delete
    end
  end

  test "Should authenticate user" do
    user = User.find_by_email("test@email.com")
    assert_not_nil user
  end	
end
