#encoding: utf-8

Given(/^I am in the users list page$/) do
  click_link("Manage users")
  assert current_path == admin_users_path, "Expected " + admin_users_path + " was "  + current_path
  assert page.has_content?("Listing users")
end

When(/^I click the new user link$/) do
  click_link_or_button( "btn_new_user")
end

When(/^I insert a user (.*) and (.*) with (.*?)$/) do |test_name, test_email, test_pass|
  fill_in("fld_email", :with => test_email)
  fill_in("fld_password", :with => test_pass)
  fill_in("fld_password_confirmation", :with => test_pass)
end

When(/^I click the submit button$/) do
  click_link_or_button("btn_create_user")
end
   
When(/^I click the delete user link (.*)$/) do |test_email|
  assert page.has_content?(@test_email)
  click_on('btn_delete_user_'+test_email)
  page.driver.browser.switch_to.alert.accept
end

Then(/^I should not see the (.*) in the table$/) do |test_email|
  assert page.has_no_content?(test_email)
end

When(/^I click the edit (.*) link$/) do |test_email|
  find(:xpath, "//a[@id='btn_edit_user_#{test_email}']").click  
end

Then(/^I should see a message (.*)$/) do |message|
  assert page.has_content?(message)
end

Then(/^I should see a link to manage users$/) do
  find_link("Manage users").visible?  
end

Then(/^I see the form filled with (.*) data$/) do |test_email|
  assert page.has_xpath?("//input[@value='#{test_email}']")
end

Then(/^I change the email for (.*) and password to (.*)$/) do |updated_email, updated_pass|
  fill_in("fld_email", :with => updated_email)
  fill_in("fld_password", :with => updated_pass)
  fill_in("fld_password_confirmation", :with => updated_pass)
end
