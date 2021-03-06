#enconding: utf-8

Feature: Static pages
  
  Scenario: Should see the Home page
    Given the home page
    When I click the Home link
      And I am in the home page 
    Then I should have the content "Welcome to the Recognition Bucks App"
      And I should have the title "Recognition Bucks App | Home"

  Scenario: should see the Help page
    Given the home page
    When I click the Help link
      And I am in the help page 
    Then I should have the content "Help"
      And I should have the title "Recognition Bucks App | Help" 

  Scenario: Should see the About page
    Given the home page
    When I click the About link
      And I am in the about page 
    Then I should have the content "About"
      And I should have the title "Recognition Bucks App | About" 

  Scenario: Click in Logo should redirect to Home page
    Given the home page
    When I click the logo
      And I am in the home page 
    Then I should have the content "Welcome to the Recognition Bucks App"
      And I should have the title "Recognition Bucks App | Home" 