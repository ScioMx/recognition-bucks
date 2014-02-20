
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

Then(/^I should see the Home page with content "(.*?)"$/) do |content|
  assert_equal current_path,  static_pages_home_path
  page.assert_selector('h1', :text => content, :visible => true)
end

Then(/^I should see the Help page with content "(.*?)"$/) do |content|
  assert_equal current_path,  static_pages_help_path
  page.assert_selector('h1', :text => content, :visible => true)
end

Then(/^I should see the About page with content "(.*?)"$/) do |content|
  assert_equal current_path,  static_pages_about_path
  page.assert_selector('h1', :text => content, :visible => true)
end
