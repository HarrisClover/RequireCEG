Feature: Implement 'Contact Us' Section with Form

  As a user
  I want to submit an inquiry through a contact form
  So that I can communicate my message to the support team

  Background:
    Given the user accesses the 'Contact Us' page
    And the contact form is displayed with fields for name, email, and message

  Scenario: Scenario 1: Successful Form Submission
    Given the user fills in all fields with valid information
    When the user submits the form
    Then the application processes the submission
    And the user is redirected to a confirmation page with their submitted data
    And a thank you message is displayed

  Scenario: Scenario 2: Form Submission with Empty Fields
    Given the user leaves one or more fields empty
    When the user attempts to submit the form
    Then the application performs a validation check
    And an error message stating 'All fields are required.' is displayed

  Scenario: Scenario 3: Server Error During Submission
    Given the user fills in all fields with valid information
    When the user submits the form but a server error occurs
    Then the application displays a user-friendly error message
    And the message 'There was an issue sending your message. Please try again later.' is shown

  Scenario: Scenario 4: Navigation After Successful Submission
    Given the user has successfully submitted the form
    When the user views the confirmation page
    Then the application provides a navigation option to return to the home page

  Scenario: Scenario 5: Form Submission Validation
    Given the user attempts to submit the form with any fields empty
    When the application performs a validation check
    Then the application displays an error message stating 'All fields are required.'

  Scenario: Scenario 6: Successful Submission with Navigation Option
    Given the user has submitted the form successfully
    Then the application includes a navigation option for users to return to the home page after submission
