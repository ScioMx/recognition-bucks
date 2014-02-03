#enconding: utf-8

Feature: Display the list of users
	In order to know which users the app has
	As an administrator
	I want to see a list of users

	Scenario: Delete user
		Given I am in the users list page
		When I click the new user link
		And I insert a user delete_test_name and delete_test@email.com
		And I click the submit button
		Then I should see delete_test@email.com in the users list.
		When I click the delete user link delete_test@email.com
		Then I should not see the delete_test@email.com in the table

	Scenario: Edit user
		Given I am in the users list page
		When I click the new user link
		When I insert a user test_name and test@email.com
		And I click the submit button
		Then I should see test@email.com in the users list.
		When I click the edit test@email.com link
		Then I should see the form filled with user data
		Then I change the name to name_edited and the email for email@edited.com
		And I click the submit button
		Then I should see a message User was successfully updated.

	Scenario: Show error editing user
		Given I am in the users list page
		When I click the new user link
		When I insert a user test_name and test@email.com
		And I click the submit button
		Then I should see test@email.com in the users list.
		When I click the edit test@email.com link
		Then I should see the form filled with user data
		Then I change the name to name_edited and the email for email$edited.com
		And I click the submit button
		Then I should see a message Email is invalid
	
	Scenario: Create new user
		Given I am in the users list page
		When I click the new user link
		When I insert a user test_name and test@email.com
		And I click the submit button
		Then I should see test@email.com in the users list.

	Scenario: Show error message for invalid email creating a new user
		Given I am in the users list page
		When I click the new user link
		When I instert a user name and an incorrect email
		And I click the submit button
		Then I should see a message Email is invalid