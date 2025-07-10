Feature: Authentication Functionality

  As a user
  I want to manage my account through login, registration, password reset, and forgot password functionalities
  So that I can securely access my account and manage my information

  Background:
    Given the system is operational
    And the user is on the authentication page

  Scenario: User initiates forgot password process with valid email
    Given the user clicks on the forgot password link
    When the user submits a valid email for validation
    Then the system should validate the email format
    And the system should check if the email is associated with an account

  Scenario: User initiates forgot password process with invalid email
    Given the user clicks on the forgot password link
    When the user submits an invalid email for validation
    Then the system should validate the email format
    And the system should return an error message indicating invalid email format

  Scenario: User logs in with valid credentials
    Given the user has a registered account
    When the user enters a valid email and password
    Then the system should grant access to the user

  Scenario: User logs in with invalid credentials
    Given the user has a registered account
    When the user enters an invalid email or password
    Then the system should display an error message indicating incorrect credentials

  Scenario: User registration with valid inputs
    Given the user is on the registration form
    When the user enters their name, email, password, and confirms the password
    Then the system should validate that all fields are filled and passwords match
    And the account should be created successfully

  Scenario: User registration with existing email
    Given the user is on the registration form
    When the user enters an email that is already associated with an account
    Then the system should display an error message indicating that the email is already in use

  Scenario: User registration with weak password
    Given the user is on the registration form
    When the user enters a password that does not meet the security criteria
    Then the system should display an error message indicating the password is too weak

  Scenario: User resets password with a valid nonce
    Given the user accesses the password reset link with a valid nonce and user ID
    When the user enters and confirms their new password
    Then the system should validate the new password according to the defined criteria
    And the password should be updated successfully

  Scenario: User resets password with invalid nonce
    Given the user accesses the password reset link with an invalid nonce
    When the user attempts to reset their password
    Then the system should display an error message indicating the reset link is invalid

  Scenario Outline: Email validation scenarios
    Given the user submits an email <email>
    When the system attempts to validate the email
    Then the validation should return <result>
    Examples:
      | email | result |
      | user@example.com | valid |
      | invalid-email | invalid format |
      | user@notregistered.com | not linked to an account |
      | user@.com | invalid format |
      | @example.com | invalid format |
      | user@example | invalid format |

