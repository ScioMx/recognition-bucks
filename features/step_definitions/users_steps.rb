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

When(/^I instert de data$/) do
  fill_in("fld_name", :with => "test name")
  fill_in("fld_email", :with => "test@email.com")
end

When(/^I click the submit button$/) do
  click_link_or_button( "btn_create_user")
end

Then(/^I should see the new user in the users list\.$/) do
  page.should have_content("test name")
end
