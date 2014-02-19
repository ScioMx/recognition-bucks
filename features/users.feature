#enconding: utf-8

Feature: User administration, as admin 
  I can Create user
  I can Retrieve user
  I can Update user
  I can Delete user

  Background: Login as admin
    Given the home page
      And I see a link for log in
    When I click the log in link
      And I am in the log in page
    When I fill the form with this information: email: test@email.com, pass: scio1234
      And I click the log in button
    Then I should see a link to manage users

  Scenario: Delete user
    Given I am in the users list page
    When I click the delete user link second_test@email.com
    Then I should not see the delete_test@email.com in the table

  Scenario: Edit user
    Given I am in the users list page
    When I click the edit second_test@email.com link
      And I see the form filled with second_test@email.com data
      And I change the email for email@edited.com and password to scio12345
      And I click the submit button
    Then I should see a message User was successfully updated.

  Scenario: Show error editing user
    Given I am in the users list page
    When I click the edit second_test@email.com link
      And I see the form filled with second_test@email.com data
      And I change the email for email&edited.com and password to scio12345
      And I click the submit button
    Then I should see a message Email is invalid
  
  Scenario: Create new user
    Given I am in the users list page
    When I click the new user link
      And I insert a user test_name and test_2@email.com with pass scio123
      And I click the submit button
    Then I should see a message User was successfully created.

  Scenario: Show error message for invalid email creating a new user
    Given I am in the users list page
    When I click the new user link
      And I insert a user name and and incorrect email with pass scio123
      And I click the submit button
    Then I should see a message Email is invalid 