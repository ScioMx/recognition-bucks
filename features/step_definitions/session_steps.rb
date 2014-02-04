Given(/^the home page$/) do
  visit(root_path)
end

Then(/^I should see a link for sign up$/) do
  assert find_link("lnk_sign_up").visible?
end

When(/^I click the sign up link$/) do
  find_link("lnk_sign_up").click
end

Then(/^I should be in the sign up page$/) do
  assert current_path.should == sign_up_path
end

When(/^I fill the form with this information: name: (.*?), email: (.*?), pass: (.*?), pass_confirm: (.*?)$/) do |name, email, pass, pass_confirm|
  fill_in("fld_name", :with => name)
  fill_in("fld_email", :with => email)
  fill_in("fld_password", :with => pass)
  fill_in("fld_password_confirmation", :with => pass_confirm)
end

When(/^click the (.*?) button$/) do |id|
  click_button(id) 
end

Then(/^I should see "(.*?)"$/) do |message|
  assert page.should have_content(message)
end

Then(/^I should see a link for log in$/) do
  assert find_link("lnk_log_in").visible?
end

When(/^I click the log in link$/) do
  click_link("lnk_log_in")
end

Then(/^I should be in the log in page$/) do
  assert current_path.should == log_in_path
end

When(/^I fill the form with this information: email: (.*?), pass: (.*?)$/) do |email, pass|
  fill_in("fld_email_log_in", :with => email)
  fill_in("fld_pass_log_in", :with => pass)
end

Then(/^I should see a link for log out$/) do
  find_link("lnk_log_out").visible?
end

When(/^I click the log out link$/) do
  click_link("lnk_log_out")
end
