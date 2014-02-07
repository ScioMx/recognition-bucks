#enconding: utf-8

Feature: User log in
	User should be able to create a session in the app and exit from it

	Background: Sign up user
		Given the home page
		Then I should see a link for sign up
		When I click the sign up link
		Then I should be in the sign up page
		When I fill the form with this information: name: jc, email: jc@test.com, pass: scio123, pass_confirm: scio123
		And click the btn_create_user button
		Then I should see "User was successfully created."

	Scenario: Log in user
		Given the home page
		Then I should see a link for log in
		When I click the log in link
		Then I should be in the log in page
		When I fill the form with this information: email: jc@test.com, pass: scio123
		And click the btn_log_in button
		Then I should see "Logged in!"

	Scenario: Log out user
		Given the home page
		Then I should see a link for log in
		When I click the log in link
		Then I should be in the log in page
		When I fill the form with this information: email: jc@test.com, pass: scio123
		And click the btn_log_in button
		Then I should see "Logged in!"
		Given the home page
		Then I should see a link for log out
		When I click the log out link
		Then I should see "Logged out!"

	Scenario: Error sign up user
		Given the home page
		Then I should see a link for sign up
		When I click the sign up link
		Then I should be in the sign up page
		When I fill the form with this information: name: , email: jc@test.com, pass: scio123, pass_confirm: scio123
		And click the btn_create_user button
		Then I should see "Name can't be blank"
		When I fill the form with this information: name: jc, email: jc\$test.com, pass: scio123, pass_confirm: scio123
		And click the btn_create_user button
		Then I should see "Email is invalid"
		When I fill the form with this information: name: jc, email: jc@test.com, pass: scio123, pass_confirm: scio12
		And click the btn_create_user button
		Then I should see "Password confirmation should match confirmation"

	Scenario: Error log in user
		Given the home page
		Then I should see a link for log in
		When I click the log in link
		Then I should be in the log in page
		When I fill the form with this information: email: no_existent_user@test.com, pass: scio123
		And click the btn_log_in button
		Then I should see "Invalid email or password"