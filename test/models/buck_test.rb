require 'test_helper'

class BuckTest < ActiveSupport::TestCase

  test "should not create buck if doesn't have receiver" do
    buck = Buck.new
    assert !buck.save	
    assert_equal "Goes to can't be blank", buck.errors.full_messages[0]
  end

  test "should not create buck if doesn't have description" do
    buck = Buck.new(goes_to: 123)
    assert !buck.save	
    assert_equal "Description can't be blank", buck.errors.full_messages[0]
  end

  test "should not create buck if doesn't have value" do
    buck = Buck.new(goes_to: 123, description: "Some description")
    buck.value = ""
    assert !buck.save	
    assert_equal "Value can't be blank", buck.errors.full_messages[0]
  end

  test "should not create buck if description is more than 140 characters" do
    buck = Buck.new(goes_to: 123, description: ("Some description" * 10))
    assert !buck.save	
    assert_equal "Description is too long (maximum is 140 characters)", buck.errors.full_messages[0]
  end

  test "should not create buck if has negative value" do
    buck = Buck.new(goes_to: 123, description: "Some description", value: -1)
    assert !buck.save	
    assert_equal "Value must be greater than 0", buck.errors.full_messages[0]
  end

  test "should not update buck if doesn't have receiver" do
    buck = bucks(:fake_buck_one)
    assert !buck.update(goes_to: "")	
    assert_equal "Goes to can't be blank", buck.errors.full_messages[0]
  end

  test "should not update buck if doesn't have description" do
    buck = bucks(:fake_buck_one)
    assert !buck.update(description: "")
    assert_equal "Description can't be blank", buck.errors.full_messages[0]
  end

  test "should not update buck if doesn't have value" do
    buck = bucks(:fake_buck_one)
    assert !buck.update(value: nil)
    assert_equal "Value can't be blank", buck.errors.full_messages[0]
  end

  test "should not update buck if description is more than 140 characters" do
    buck = bucks(:fake_buck_one)
    assert !buck.update(description: "n" * 150)
    assert_equal "Description is too long (maximum is 140 characters)", buck.errors.full_messages[0]
  end

  test "should not update buck if has negative value" do
    buck = bucks(:fake_buck_one)
    assert !buck.update(value: -1)
    assert_equal "Value must be greater than 0", buck.errors.full_messages[0]
  end
end
