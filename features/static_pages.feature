#enconding: utf-8

Feature: Static pages

  Scenario: Home
    Given the home page
    Then it should have the content "Recognition Bucks App"
    And it should have the title "Recognition Bucks App | Home" 

  Scenario: Help
    Given the help page
    Then it should have the content "Help"
    And it should have the title "Recognition Bucks App | Help" 

  Scenario: About
    Given the about page
    Then it should have the content "About"
    And it should have the title "Recognition Bucks App | About" 