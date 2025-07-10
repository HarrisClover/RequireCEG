Feature: Display Contact Us Form

  As a user
  I want to fill out a contact form
  So that I can communicate with the support team

  Background:
    Given the user navigates to the 'Contact Us' page
    And the contact form is displayed with fields for name, email, subject, and message

  Scenario: Scenario 1: Successful form submission
    Given the user fills out all fields
    And the email is in valid format
    When the user submits the form
    Then the system displays a confirmation message stating 'Your message has been sent to the team.'
    And the fields are cleared for the next user interaction

  Scenario: Scenario 2: Missing required fields
    Given the user fills out the form but leaves one or more fields empty
    When the user attempts to submit the form
    Then the system presents an error message indicating that all fields must be filled out

  Scenario: Scenario 3: Invalid email format
    Given the user fills out all fields
    And the email is in invalid format
    When the user submits the form
    Then the system prompts the user with a message to enter a valid email address

  Scenario: Scenario 4: Email format Validation
    Given the user fills out all fields
    And the email is in invalid format
    When the user submits the form
    Then the system displays an error message 'Please enter a valid email address.'
