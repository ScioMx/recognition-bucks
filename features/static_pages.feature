#enconding: utf-8

Feature: Static pages
  
  Background: Visit main page
    Given the home page

  Scenario: Home
    When I click the Home link
    Then it should have the content "Welcome to the Recognition Bucks App"
    And it should have the title "Recognition Bucks App | Home"
    And I should be in the home page 

  Scenario: Help
    When I click the Help link
    Then it should have the content "Help"
    And it should have the title "Recognition Bucks App | Help" 
    And I should be in the help page 

  Scenario: About
    When I click the About link
    Then it should have the content "About"
    And it should have the title "Recognition Bucks App | About" 
    And I should be in the about page 

  Scenario: Logo
    When I click the logo
    Then it should have the content "Welcome to the Recognition Bucks App"
    And it should have the title "Recognition Bucks App | Home" 
    And I should be in the home page 