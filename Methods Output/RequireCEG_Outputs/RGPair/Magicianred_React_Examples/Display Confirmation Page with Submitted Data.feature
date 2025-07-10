Feature: Display Confirmation Page with Submitted Data

  As a user
  I want to submit a contact form and receive confirmation
  So that I know my message has been received successfully

  Background:
    Given the contact form is displayed
    And the user is aware of required fields

  Scenario: Valid submission of contact form
    Given the user has filled in all required fields with valid data
    When the user submits the contact form
    Then the system redirects to the confirmation page
    And the confirmation page displays the user's name, email, and message

  Scenario: Submission with missing name field
    Given the user has left the name field empty
    When the user attempts to submit the contact form
    Then the system displays an error message indicating the missing name field
    And the error message remains visible until the name field is filled

  Scenario: Submission with missing email field
    Given the user has left the email field empty
    When the user attempts to submit the contact form
    Then the system displays an error message indicating the missing email field
    And the error message remains visible until the email field is filled

  Scenario: Submission with missing message field
    Given the user has left the message field empty
    When the user attempts to submit the contact form
    Then the system displays an error message indicating the missing message field
    And the error message remains visible until the message field is filled

  Scenario: Submission with all fields empty
    Given the user has left all required fields empty
    When the user attempts to submit the contact form
    Then the system displays error messages indicating all fields need completion
    And the error messages remain visible until all required fields are filled
