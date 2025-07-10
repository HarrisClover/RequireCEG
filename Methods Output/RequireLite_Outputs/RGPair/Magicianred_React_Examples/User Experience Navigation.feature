Feature: User Experience Navigation

  As a user
  I want to navigate the application seamlessly
  So that I can easily find the information I need

  Background:
    Given the application has a home page with headers, footers, and menus
    And the user is logged in to the application

  Scenario: Viewing Home Page
    Given the user accesses the home page
    When the user views the navigation menu
    Then the menu should include links to 'About Us', 'Contact Us', and error pages
    And the user should be able to navigate to any primary section

  Scenario: Accessing About Us Page
    Given the user clicks on the 'About Us' link
    When the user views the 'About Us' page
    Then the page should feature links to 'Who Are' and 'Where Are'

  Scenario: Accessing Contact Us Page
    Given the user clicks on the 'Contact Us' link
    When the user views the 'Contact Us' page
    Then the page should display a form requiring email, name, and message fields
    And the form should have validation for all required fields

  Scenario: Form Submission with Valid Data
    Given the user fills in all required fields on the contact form
    When the user submits the form
    Then the user should see a confirmation page displaying submitted data and a thank you message

  Scenario: Form Submission with Invalid Data
    Given the user fills in invalid data in one or more fields on the contact form
    When the user submits the form
    Then the form should display validation errors for the invalid fields

  Scenario: Handling Generic Errors
    Given the user encounters an unexpected error during navigation
    When the user is redirected to the error handling page
    Then the user should receive a clear and user-friendly error message explaining the issue

  Scenario Outline: Invalid Path Navigation
    Given the user navigates to an invalid path '<invalid-path>'
    When the user attempts to access the path
    Then the application should display a consistent 'Not Found' page
    Examples:
      | /invalid-page |
      | /non-existent |
      | /random-path |


  Scenario: Initial State Navigation
    Given the user is not logged in
    When the user tries to access a primary section
    Then the user should be prompted to log in or redirected to the login page

  Scenario: Page Loading Performance
    Given the user navigates between pages
    When the user clicks on a link
    Then the page should load within an acceptable time frame (e.g. under 2 seconds)
