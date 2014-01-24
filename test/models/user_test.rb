require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save user if has an empty property" do
  	user = User.new
  	assert !user.save, "User saved with an empty propetry"
  end

end
