Feature: Display Header with Logo and Navigation Menu

  As a website user
  I want to easily navigate through different sections of the site
  So that I can find the information I'm looking for effortlessly

  Background:
    Given the application is started
    And the header is rendered with the logo and navigation menu

  Scenario: User clicks on 'About Us'
    Given the navigation menu is visible
    When the user clicks on 'About Us'
    Then the user is redirected to the About Us page
    And the subsections 'Who Are' and 'Where Are' are displayed

  Scenario: User clicks on 'Contact Us'
    Given the navigation menu is visible
    When the user clicks on 'Contact Us'
    Then the user is redirected to the Contact Us page
    And a contact form is presented

  Scenario: User submits the contact form with missing fields
    Given the contact form is displayed
    When the user submits the form without filling required fields
    Then the system generates a validation error message
    And the fields that need attention are indicated

  Scenario: User successfully submits the contact form
    Given the contact form is displayed with all required fields filled
    When the user submits the form
    Then a confirmation page is displayed
    And the submitted data along with a thank you message is shown

  Scenario: User accesses an invalid path
    Given the user navigates to an invalid URL
    When the system processes the request
    Then the user is redirected to a 'Not Found' page
    And user-friendly error messages are displayed

  Scenario: User navigates with valid conditions
    Given the application is starting
    And the header is rendered
    When the user looks at the displayed header
    Then the logo should be displayed
    And the navigation menu should contain links

  Scenario: User accesses an unfilled contact form
    Given the user is on the Contact Us page
    When the contact form is displayed with fields empty
    Then the system should prepare to generate validation messages
    And the user must fill all required fields
