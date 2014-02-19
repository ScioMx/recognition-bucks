#enconding: utf-8

Feature: User log in
  User should be able to create a session in the app and exit from it

  Scenario: Sign up user
    Given the home page with a sign up link visible
    When I click the sign up link
      And I fill the form with: email = jc@test.com, pass = scio1234
    Then I should see "Welcome! You have signed up successfully."

  Scenario: Log in user
    Given the home page with a log in link visible
    When I click the log in link
      And I fill the log in form with: email = test@email.com, pass = scio1234
    Then I should see "Signed in successfully."

  Scenario: Log out user
    Given the home page with with a log out link visible
    When I click the log out link
    Then I should see "Signed out successfully."

  Scenario: Error sign up user "Email can't be blank"
    Given the sign up page
    When I send my information without email
    Then I should see "Email can't be blank"

  Scenario: Error sign up user "Email has already been taken"
    Given the sign up page
    When I fill the form with: email = test@email.com, pass = scio1234
    Then I should see "Email has already been taken"

  Scenario: Error sign up user "Email is invalid"
    Given the sign up page
    When I fill the form with: email = jc@test, pass = scio1234
    Then I should see "Email is invalid"

  Scenario: Error sign up user "Password confirmation doesn't match Password"
    Given the sign up page
    When I fill the form with this: email = jc5@test.com, pass = scio1234, pass_confirm = scio12
    Then I should see "Password confirmation doesn't match Password"

  Scenario: Error log in user
    Given the log in page
    When I fill the log in form with: email = no_existent_user@test.com, pass = scio1234
    Then I should see "Invalid email or password"