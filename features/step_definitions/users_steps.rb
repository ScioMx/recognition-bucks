#encoding: utf-8

When(/^I visit the list of users$/) do
  visit users_path
end

Given(/^I am in the users list page$/) do
  visit users_path
end

When(/^I click the new user link$/) do
  click_link_or_button( "btn_new_user")
end

When(/^I insert a user (.*) and (.*) with (.*?)$/) do |test_name, test_email, test_pass|
  fill_in("fld_name", :with => test_name)
  fill_in("fld_email", :with => test_email)
  fill_in("fld_password", :with => test_pass)
  fill_in("fld_password_confirmation", :with => test_pass)
end

When(/^I click the submit button$/) do
  click_link_or_button("btn_create_user")
end

Then(/^I should see (.*) in the users list\.$/) do |test_email|
  visit users_path
  assert page.has_content?(test_email)
end

When(/^I instert a user name and an incorrect email$/) do
  fill_in("fld_name", :with => "test name")
  fill_in("fld_email", :with => "test&email.com")
end

Then(/^I should see a message for user creation faill$/) do
  assert page.has_content?("Email is invalid")
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

Then(/^I should see the form filled with (.*) and (.*) data$/) do |test_name, test_email|
  assert page.has_xpath?("//input[@value='#{test_name}']")
  assert page.has_xpath?("//input[@value='#{test_email}']")
end

Then(/^I change the name to (.*) and the email for (.*)$/) do |edited_name, edited_email|
  fill_in("fld_name", :with => edited_name)
  fill_in("fld_email", :with => edited_email)
end

Then(/^I should see a message (.*)$/) do |message|
  assert page.has_content?(message)
end
