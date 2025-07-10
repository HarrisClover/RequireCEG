Feature: Application Navigation and Structure
  As a user
  I want consistent navigation elements like headers, footers, and menus
  So that I can easily navigate the application and access different sections.

  Background:
    Given the user starts the application

  Scenario: Viewing the Home Page Structure
    When the user lands on the home page
    Then the user should see a header section
    And the user should see a footer section
    And the user should see navigation menus

  Scenario: Navigating to Primary Sections from Header Menu
    When the user navigates to "About Us" using the header menu
    Then the user should be on the "About Us" page
    When the user navigates back to the home page
    And the user navigates to "Contact Us" using the header menu
    Then the user should be on the "Contact Us" page

  Scenario: Navigating to Primary Sections from Footer Menu
    When the user navigates to "About Us" using the footer menu
    Then the user should be on the "About Us" page
    When the user navigates back to the home page
    And the user navigates to "Contact Us" using the footer menu
    Then the user should be on the "Contact Us" page