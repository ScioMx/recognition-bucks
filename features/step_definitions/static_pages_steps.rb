Given(/^the help page$/) do
  visit static_pages_help_path
end


When(/^I click the Home link$/) do
  click_link("Home")
end

When(/^I click the Help link$/) do
  click_link("Help")
end

When(/^I click the About link$/) do
  click_link("About")
end

When(/^I click the logo$/) do
  click_link("Logo")
end

Then(/^it should have the content "(.*?)"$/) do |content|
  page.assert_selector('h1', :text => content, :visible => true)
end

Then(/^it should have the title "(.*?)"$/) do |title|
 page.has_text?('title', :text => title)
end

Then(/^I should be in the home page$/) do
  assert_equal current_path,  static_pages_home_path
end

Then(/^I should be in the help page$/) do
  assert_equal current_path,  static_pages_help_path
end

Then(/^I should be in the about page$/) do
  assert_equal current_path,  static_pages_about_path
end
