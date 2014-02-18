Given(/^the home page$/) do
  visit(root_path)
end

Then(/^I see a link for sign up$/) do
  assert find_link("lnk_sign_up").visible?
end

When(/^I click the sign up link$/) do
  find_link("lnk_sign_up").click
end

Then(/^I am in the sign up page$/) do
  assert current_path ==  new_user_registration_path, "Expected " + new_user_session_path + " was "  + current_path
end

When(/^I fill the form with this information: name: (.*?), email: (.*?), pass: (.*?), pass_confirm: (.*?)$/) do |name, email, pass, pass_confirm|
  fill_in("fld_devise_email", :with => email)
  fill_in("fld_devise_password", :with => pass)
  fill_in("fld_devise_password_confirmation", :with => pass_confirm)
end

When(/^I fill the form with this information: name: (.*?), email: (.*?), pass: (.*?), pass_confirm: (.*?) for administrator$/) do |name, email, pass, pass_confirm|
  fill_in("fld_email", :with => email)
  fill_in("fld_password", :with => pass)
  fill_in("fld_password_confirmation", :with => pass_confirm)
end

When(/^I click the create button for administrator$/) do 
  click_button("btn_create_user") 
end

When(/^I click the create button$/) do 
  click_button("btn_devise_create_user") 
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

Then(/^I see a link for log out$/) do
  find_link("lnk_log_out").visible?
end

When(/^I click the log out link$/) do
  click_link("lnk_log_out")
end

Then(/^I log out if I am already loged in$/) do
  click_link("lnk_log_out") if find_link("lnk_log_out").visible?
end
