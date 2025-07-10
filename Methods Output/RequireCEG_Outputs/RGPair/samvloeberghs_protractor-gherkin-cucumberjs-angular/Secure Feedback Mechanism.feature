Feature: Secure Feedback Mechanism

  As a user
  I want to reset my password securely
  So that I can regain access to my account safely

  Background:
    Given the user is on the password reset page
    And the system has a valid user email address

  Scenario: Scenario 1: Valid Email Format
    Given the user initiates the forgot password process
    When the user submits their email address
    Then the system should validate the email format
    And if invalid, an error message should indicate to enter a valid email address

  Scenario: Scenario 2: Valid Email with Account
    Given the user submits a valid email address linked to an account
    When the system processes the request
    Then a confirmation message should be displayed indicating that a password reset email has been sent

  Scenario: Scenario 3: Invalid Credentials
    Given a user attempts to log in
    When the user inputs an invalid email or password
    Then an error message should be shown stating that the credentials do not match any account

  Scenario: Scenario 4: Registration Missing Fields
    Given the user is on the registration page
    When the user omits any required fields
    Then the system should identify the specific fields requiring correction
    And display appropriate error messages to the user

  Scenario: Scenario 5: Password Reset Link Validation
    Given the user clicks the reset password link
    When the system verifies the nonce and user ID
    Then if valid, the password reset form should be displayed
    And if invalid, an error message should inform the user that the link is invalid

  Scenario: Scenario 6: New Password Submission
    Given the user submits a new password
    When the system checks the new password against defined security criteria
    Then if the password fails to meet the criteria, specific feedback should be provided outlining the issues that need to be addressed

  Scenario: Scenario 7: Complete Registration
    Given the user is on the registration page
    When the user fills in all required fields correctly and matches the passwords
    Then the registration process should complete successfully
