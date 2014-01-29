require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not create user if it has an empty property" do
  	user = User.new
  	assert !user.save, "User cannot be created with an empty property"
  end

  test "should not create user if it has an invalid email" do
  	user = User.new
  	user.email = "te_st&invalidemail.com"
  	user.name = "name"
  	assert_not user.save, "User cannot be created with an invalid email"
  end

  test "should create new user" do
  	user = User.new
  	user.email = "te_st@email.com"
  	user.name = "name"
  	assert user.save, "User was not created"
  end

  test "should not update user if it has an empty property" do
  	user = users(:fake_user)
  	assert_not user.update({:name => "test name", :email => ""}), "User cannot be updated with an empty property"
  end

  test "should not update user if it has an invalid email" do
  	user = users(:fake_user)
  	assert_not user.update({:name => "test name", :email => "te_st&invalidemail.com"}), "User cannot be updated with an invalid email"
  end

  test "should update user" do
  	user = users(:fake_user)
  	assert user.update({:name => "test name", :email => "te_st@email.com"}), "The user was not updated"
  end



end
