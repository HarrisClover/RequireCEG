Feature: User Registration and Authentication

  As a new user
  I want to complete the registration form with valid personal details
  So that I can successfully register and access my account

  Background:
    Given the user is on the registration page
    And the user is aware of personal details required for registration

  Scenario: Scenario 1: Successful Registration
    Given the user enters a valid email format
    And the user provides a non-empty username
    And the user sets a password that meets the complexity requirements
    When the user submits the registration form
    Then the system authenticates the input
    And the user is redirected to the login page with a success message confirming that registration has been completed

  Scenario: Scenario 2: Invalid Email Format
    Given the user enters an invalid email format
    When the user submits the registration form
    Then the system displays an error message indicating 'Invalid email format'

  Scenario: Scenario 3: Username Cannot Be Empty
    Given the user enters a username that is empty
    When the user submits the registration form
    Then the system displays an error message indicating 'Username cannot be empty'

  Scenario: Scenario 4: Password Complexity Requirement Not Met
    Given the user enters a password that does not meet complexity requirements
    When the user submits the registration form
    Then the system displays an error message indicating 'Password does not meet complexity requirements'

  Scenario: Scenario 5: Session Invalidated During Registration Process
    Given the user's session becomes invalid during the registration process
    When the user attempts to submit the registration form
    Then the system logs the user out
    And redirects them to the login page with a warning message indicating there was an issue with the session

  Scenario: Scenario 6: Invalid Session Handling During Registration
    Given the user's session is valid
    And the user fills out the registration form with valid details
    When it is detected that the session is invalid before submission
    Then the system automatically logs the user out
    And redirects them back to the login page with a warning message indicating there was an issue with the session
