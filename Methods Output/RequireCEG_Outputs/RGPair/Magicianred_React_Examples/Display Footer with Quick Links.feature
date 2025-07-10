Feature: Display Footer with Quick Links

  As a user
  I want to have easy access to essential information through quick links
  So that I can navigate the application seamlessly and find relevant information.

  Background:
    Given the footer is present on every page of the application
    And the footer contains quick links to 'About Us', 'Contact Us', and 'Error Pages'

  Scenario: Scenario 1: Navigate to About Us page
    Given the user is on the home page
    When the user clicks on the 'About Us' link
    Then the user should be directed to the About Us page
    And the relevant information should be displayed on the About Us page

  Scenario: Scenario 2: Navigate to Contact Us page
    Given the user is on the home page
    When the user clicks on the 'Contact Us' link
    Then the user should be directed to the Contact Us page
    And a message form should be presented for user input on the Contact Us page

  Scenario: Scenario 3: Navigate to Not Found Error Page
    Given the user clicks on an invalid quick link
    When the application attempts to navigate to the invalid URL
    Then the system should display a consistent 'Not Found' error page

  Scenario: Scenario 4: Footer Requirements
    Given the user is on the About Us page
    When the application is displaying the footer
    Then the footer must contain quick links
    And the footer is displayed as specified
