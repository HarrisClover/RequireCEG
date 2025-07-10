Feature: Basic Page Navigation
  As a user
  I want to navigate between pages using navigation controls
  So that I can access different sections of the application

  Scenario: Navigate from the first page to the second page
    Given the user is on the first page of the application
    When the user clicks the 'next page' button
    Then the user should be successfully navigated to the second page
    And the transition should be seamless without noticeable delays # Implies effective wait handling