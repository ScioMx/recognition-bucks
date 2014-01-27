#encoding: utf-8

When(/^I visit the list of users$/) do
	  visit users_path
end

Then(/^I should see all users$/) do
  
end


# Add new user

Given(/^I am in the users list page$/) do
  visit users_path
end

When(/^I click the new user link$/) do
  click_link_or_button( "btn_new_user")
end

Then(/^I should see the form to create a new user$/) do
  
end

When(/^I insert a user (.*) and (.*)$/) do |test_name, test_email|
  fill_in("fld_name", :with => test_name)
  fill_in("fld_email", :with => test_email)
end

When(/^I click the submit button$/) do
  click_link_or_button( "btn_create_user")
end

Then(/^I should see (.*) in the users list\.$/) do |test_email|
  page.should have_content(test_email)
end


# Show create user message error

When(/^I instert a user name and an incorrect email$/) do
  fill_in("fld_name", :with => "test name")
  fill_in("fld_email", :with => "test&email.com")
end

Then(/^I should see a message for user creation faill$/) do
  page.should have_content("Email is invalid")
end


# Delete user

When(/^I click the delete user link (.*)$/) do |test_email|

	test_user = User.find_by email: test_email

	test_user.save

  element = find(:xpath, "//*[@id='btn_delete_user' and @href='/users/#{test_user.id}']")
  element.click

end

Then(/^A pop up window ask if are you sure\?$/) do
  page.driver.browser.switch_to.alert.accept

end

Then(/^I should not see the (.*) in the table$/) do |test_email|
  page.should have_no_content(test_email)
end
