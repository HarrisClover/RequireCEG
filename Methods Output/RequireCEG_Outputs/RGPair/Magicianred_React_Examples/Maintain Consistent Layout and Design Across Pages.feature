Feature: Maintain Consistent Layout and Design Across Pages

  As a web application user
  I want a consistent layout with identical headers, footers, and menus across all pages
  So that I can navigate the application intuitively without confusion

  Background:
    Given the web application has a uniform design
    And consistent user experience throughout all sections

  Scenario: User navigates to About Us page
    Given a user is on the homepage
    When the user clicks on the About Us link in the menu
    Then the About Us page should display links to the Who Are and Where Are subsections
    And the menu should remain unchanged
    And the headers and footers should be identical to those on other pages

  Scenario: User fills out the Contact Us form
    Given a user is on the Contact Us page
    When the user fills in the email, name, and message fields
    Then all fields should be clearly labeled
    And the message form should be fully visible
    And the headers and footers should remain consistent with the rest of the application

  Scenario: User submits an incomplete Contact Us form
    Given the user is on the Contact Us page
    When the user leaves required fields blank
    And the user attempts to submit the form
    Then an error message should indicate which specific fields are missing

  Scenario: User successfully submits the contact form
    Given the user is on the Contact Us page
    And the user fills all required fields correctly
    When the user submits the form
    Then the user should be redirected to a confirmation page
    And the confirmation page should display a thank you message with the submitted data

  Scenario: User accesses an invalid URL
    Given a user attempts to navigate to a non-existent page
    When the user enters an invalid URL in the address bar
    Then the user should see a Not Found page
    And the page should guide them back to a valid section of the application
    And the headers and footers on the Not Found page should be consistent with the application

  Scenario: User submits form without filling required fields and has headers identical across pages
    Given the user is on the Contact Us page
    When the user leaves required fields blank and submits the form
    Then an error message indicating which specific fields are missing should be displayed
    And the headers and footers should remain identical to those on other pages
