Given(/^the home page$/) do
  visit(root_path)
end

When(/^I click the sign up link$/) do
  find_link("lnk_sign_up").click
end

When(/^I click the log in button$/) do 
  click_button("btn_log_in") 
end

Then(/^I should see "(.*?)"$/) do |message|
  assert page.has_content?(message)
end

Then(/^I see a link for log in$/) do
  assert find_link("lnk_log_in").visible?
end

When(/^I click the log in link$/) do
  click_link("lnk_log_in")
end

Then(/^I am in the log in page$/) do
  assert current_path == new_user_session_path, "Expected " + new_user_session_path + " was "  + current_path
end

When(/^I fill the form with this information: email: (.*?), pass: (.*?)$/) do |email, pass|
  fill_in("fld_email_log_in", :with => email)
  fill_in("fld_pass_log_in", :with => pass)
end

When(/^I click the log out link$/) do
  click_link("lnk_log_out")
end

Given(/^the home page with a sign up link visible$/) do
  visit(root_path)
  assert find_link("lnk_sign_up").visible?
end

When(/^I fill the form with: email = (.*), pass = (.*)$/) do |email, pass|
  fill_in("fld_devise_email", :with => email)
  fill_in("fld_devise_password", :with => pass)
  fill_in("fld_devise_password_confirmation", :with => pass)
  click_button("btn_devise_create_user") 
end

Given(/^the home page with a log in link visible$/) do
  visit(root_path)
  assert find_link("lnk_log_in").visible?
end

Given(/^the home page with with a log out link visible$/) do
  visit(new_user_session_path)
  fill_in("fld_email_log_in", :with => "test@email.com")
  fill_in("fld_pass_log_in", :with => "scio1234")
  click_button("btn_log_in") 
  visit(root_path)
  assert find_link("lnk_log_out").visible?
end

Given(/^the sign up page$/) do
  visit(new_user_registration_path)
end

When(/^I send my information without email$/) do
   click_button("btn_devise_create_user")
end

When(/^I fill the form with this: email = (.*), pass = (.*), pass_confirm = (.*)$/) do |email, pass, pass_confirm|
  fill_in("fld_devise_email", :with => email)
  fill_in("fld_devise_password", :with => pass)
  fill_in("fld_devise_password_confirmation", :with => pass_confirm)
  click_button("btn_devise_create_user") 
end

When(/^I fill the log in form with: email = (.*), pass = (.*)$/) do |email, pass|
  fill_in("fld_email_log_in", :with => email)
  fill_in("fld_pass_log_in", :with => pass)
  click_button("btn_log_in") 
end

Given(/^the log in page$/) do
  visit(new_user_session_path)
end
