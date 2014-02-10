Given(/^the help page$/) do
  visit static_pages_help_path
end

Given(/^the about page$/) do
  visit static_pages_about_path
end

Then(/^it should have the content "(.*?)"$/) do |content|
  page.has_content?(content)
end

Then(/^it should have the title "(.*?)"$/) do |title|
  page.has_title?(title)
end
