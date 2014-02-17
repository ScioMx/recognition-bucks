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
    When I fill the form with this information: email: test@email.com, pass: scio1234
    And click the log in button
    Then I should see "Signed in successfully."
    And a link to manage users
    When I visit the list of users
    Given I am in the users list page

  Scenario: Delete user
    When I click the delete user link second_test@email.com
    Then I should not see the delete_test@email.com in the table

  Scenario: Edit user
    When I click the edit second_test@email.com link
    Then I should see the form filled with second_test@email.com data
    Then I change the email for email@edited.com and password to scio12345 instead of scio1234
    And I click the submit button
    Then I should see a message User was successfully updated.

  Scenario: Show error editing user
    When I click the edit second_test@email.com link
    Then I should see the form filled with second_test@email.com data
    Then I change the email for email&edited.com and password to scio12345 instead of scio1234
    And I click the submit button
    Then I should see a message Email is invalid
  
  Scenario: Create new user
    When I click the new user link
    When I insert a user test_name and test_2@email.com with pass scio123
    And I click the submit button
    Then I should see a message User was successfully created.

  Scenario: Show error message for invalid email creating a new user
    When I click the new user link
    When I insert a user name and and incorrect email with pass scio123
    And I click the submit button
    Then I should see a message Email is invalid 