#enconding: utf-8

Feature: User administration, as admin 
	I can Create user
	I can Retrive user
	I can Update user
	I can Delete user

	Background: Login as admin
		Given the home page
		Then I should see a link for log in
		When I click the log in link
		Then I should be in the log in page
		When I fill the form with this information: email: test@email.com, pass: scio123
		And click the log in button
		Then I should see "Logged in!"
		Given I am in the users list page
		When I click the new user link

	Scenario: Delete user
		When I insert a user delete_test_name and delete_test@email.com with pass scio123
		And I click the submit button
		Then I should see delete_test@email.com in the users list.
		When I click the delete user link delete_test@email.com
		Then I should not see the delete_test@email.com in the table

	Scenario: Edit user
		When I insert a user test_some_name and test_other@email.com with pass scio123
		And I click the submit button
		Then I should see test_other@email.com in the users list.
		When I click the edit test_other@email.com link
		Then I should see the form filled with test_some_name and test_other@email.com data
		Then I change the name to name_edited and the email for email@edited.com
		And I click the submit button
		Then I should see a message User was successfully updated.

	Scenario: Show error editing user
		When I insert a user test_name_3 and test_3@email.com with pass 
		And I click the submit button
		Then I should see test_3@email.com in the users list.
		When I click the edit test_3@email.com link
		Then I should see the form filled with test_name_3 and test_3@email.com data
		Then I change the name to name_edited and the email for email$edited.com
		And I click the submit button
		Then I should see a message Email is invalid
	
	Scenario: Create new user
		When I insert a user test_name and test_2@email.com with pass scio123
		And I click the submit button
		Then I should see a message User was successfully created.

	Scenario: Show error message for invalid email creating a new user
		When I insert a user name and and incorrect email with pass scio123
		And I click the submit button
		Then I should see a message Email is invalid 