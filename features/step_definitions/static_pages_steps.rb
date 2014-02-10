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

Then(/^it should have the content "(.*?)"$/) do |content|
  page.assert_selector('h1', :text => content, :visible => true)
end

Then(/^it should have the title "(.*?)"$/) do |title|
 page.has_text?('title', :text => title)
end
