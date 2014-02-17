#enconding: utf-8

Feature: Static pages
  
  Background: Visit main page
    Given the home page

  Scenario: Should see the Home page
    When I click the Home link
    And I should be in the home page 
    Then it should have the content "Welcome to the Recognition Bucks App"
    And it should have the title "Recognition Bucks App | Home"

  Scenario: should see the Help page
    When I click the Help link
    And I should be in the help page 
    Then it should have the content "Help"
    And it should have the title "Recognition Bucks App | Help" 

  Scenario: Should see the About page
    When I click the About link
    And I should be in the about page 
    Then it should have the content "About"
    And it should have the title "Recognition Bucks App | About" 

  Scenario: Click in Logo should redirect to Home page
    When I click the logo
    And I should be in the home page 
    Then it should have the content "Welcome to the Recognition Bucks App"
    And it should have the title "Recognition Bucks App | Home" 