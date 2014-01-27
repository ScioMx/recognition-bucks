require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not save user if has an empty property" do
  	user = User.new
  	assert !user.save, "User cannot be saved with an empty property"
  end

end
