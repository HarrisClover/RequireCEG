Feature: Email and Password Input

  As a user
  I want to be able to log in, reset my password, and register for an account
  So that I can access my account and manage my information

  Background:
    Given the system is running
    And the user is at the login or registration page

  Scenario: Login with valid email and correct password
    Given the user inputs a valid email address
    And the user inputs the correct password
    When the user submits the login form
    Then access is granted
    And the user is redirected to the dashboard

  Scenario: Login with valid email and incorrect password
    Given the user inputs a valid email address
    And the user inputs an incorrect password
    When the user submits the login form
    Then the feedback 'Invalid password. Please try again.' is displayed

  Scenario: Reset password with unassociated email
    Given the user inputs an email address that is not linked to any account
    When the user requests a password reset
    Then the message 'This email is not associated with any account.' is displayed

  Scenario: Password reset link for valid email
    Given the user inputs a valid email address linked to an account
    When the user requests a password reset
    Then the message 'A password reset link has been sent to your email.' is displayed

  Scenario: Registration with empty fields
    Given the user attempts to register with empty fields
    When the user submits the registration form
    Then the message 'All fields are mandatory.' is displayed

  Scenario: Registration with mismatched passwords
    Given the user inputs two different passwords
    When the user submits the registration form
    Then the message 'Passwords do not match. Please try again.' is displayed

  Scenario: Successful registration
    Given the user fills in all required fields correctly
    And the passwords match
    When the user submits the registration form
    Then an account is created
    And the message 'Registration successful. Please log in.' is displayed

  Scenario: Password reset with invalid reset link
    Given the user receives a password reset email with an invalid link
    When the user attempts to use the reset link
    Then the message 'Invalid reset link. Please request a new one.' is displayed

  Scenario: Successful password reset
    Given the user has a valid reset link
    When the user inputs a new password that meets the criteria and matches confirmation
    Then the password is updated
    And the message 'Your password has been successfully reset. You can now log in.' is displayed

  Scenario Outline: Password reset with invalid new password
    Given the user has a valid reset link
    When the user inputs a new password '<password>'
    Then the message 'Password must be at least 8 characters long and include a number. Please try again.' is displayed
    Examples:
      | password |
      | short |
      | allletters |
      | 12345678 |
      | abcdefgh |
      | ValidPass! |


  Scenario: Login with valid email but not associated account
    Given the user inputs a valid email address
    And the email is associated with an existing account but the account is disabled
    When the user submits the login form
    Then the feedback 'This email is not associated with any account.' is displayed

  Scenario: Password reset with valid email but the email not linked
    Given the user inputs an email address that is not linked to any account
    When the user requests a password reset
    Then the message 'This email is not associated with any account.' is displayed

  Scenario: Login with valid email and valid password
    Given the user inputs a valid email address
    And the user enters the correct password
    When the user submits the login form
    Then the feedback 'Access granted. Redirecting to the dashboard.' is displayed
