#enconding: utf-8

Feature: Static pages
  
  Scenario: Should see the Home page
    Given the home page
    When I click the Home link
    Then I should see the Home page with content "Welcome to the Recognition Bucks App"

  Scenario: should see the Help page
    Given the home page
    When I click the Help link
    Then I should see the Help page with content "Help"

  Scenario: Should see the About page
    Given the home page
    When I click the About link
    Then I should see the About page with content "About"

  Scenario: Click in Logo should redirect to Home page
    Given the home page
    When I click the logo
    Then I should see the Home page with content "Welcome to the Recognition Bucks App"