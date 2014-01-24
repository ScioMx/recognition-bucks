#enconding: utf-8

Feature: Display the list of users
	In order to know which user the app have
	As administrator
	I want to see a list of users

	Scenario: Show registered users
		When I visit the list of users
		Then I should see all users

	Scenario: Create new user
		Given I am in the users list page
		When I click the new user link
		Then I should see the form to create a new user
		When I instert de data
		And I click the submit button
		Then I should see the new user in the users list.