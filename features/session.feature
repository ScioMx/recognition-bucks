#enconding: utf-8

Feature: User log in
  User should be able to create a session in the app and exit from it

  Background: Sign up user
    Given the home page
    Then I should see a link for sign up
    When I click the sign up link
    Then I should be in the sign up page
    When I fill the form with this information: name: jc, email: jc@test.com, pass: scio1234, pass_confirm: scio1234
    And click the create button
    Then I should see "Welcome! You have signed up successfully."

  Scenario: Log in user
    Given the home page
    Then I log out if I am already loged in
    Then I should see a link for log in
    When I click the log in link
    Then I should be in the log in page
    When I fill the form with this information: email: jc@test.com, pass: scio1234
    And click the log in button
    Then I should see "Signed in successfully."

  Scenario: Log out user
    Given the home page
    Then I should see a link for log out
    When I click the log out link
    Then I should see "Signed out successfully."

  Scenario: Error sign up user
    Given the home page
    Then I log out if I am already loged in
    Then I should see a link for sign up
    When I click the sign up link
    Then I should be in the sign up page
    And click the create button 
    Then I should see "Email can't be blank"
    When I fill the form with this information: name: jc, email: jc@test.com, pass: scio1234, pass_confirm: scio1234
    And click the create button 
    Then I should see "Email has already been taken"
    When I fill the form with this information: name: jc, email: jc@test, pass: scio1234, pass_confirm: scio1234
    And click the create button 
    Then I should see "Email is invalid"
    When I fill the form with this information: name: jc, email: jc5@test.com, pass: scio1234, pass_confirm: scio12
    And click the create button 
    Then I should see "Password confirmation doesn't match Password"

  Scenario: Error log in user
    Given the home page
    Then I log out if I am already loged in
    Then I should see a link for log in
    When I click the log in link
    Then I should be in the log in page
    When I fill the form with this information: email: no_existent_user@test.com, pass: scio1234
    And click the log in button
    Then I should see "Invalid email or password"