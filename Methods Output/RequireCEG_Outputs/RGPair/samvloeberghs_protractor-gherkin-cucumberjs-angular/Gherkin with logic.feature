Feature: User Account Management

  As a user
  I want to manage my account including password recovery and registration
  So that I can ensure my account security and access it whenever needed

  Background:
    Given the system is online
    And the user has established an account with valid credentials

  Scenario: Scenario 1: Forgot Password with Invalid Email Format
    Given a user clicks on the 'Forgot Password' link
    When the user inputs an invalid email format
    Then the system displays an error message stating 'Please enter a valid email format.'

  Scenario: Scenario 2: Forgot Password with Unassociated Email
    Given a user clicks on the 'Forgot Password' link
    When the user inputs a valid email that is not linked to any account
    Then the system displays an error message stating 'No account is associated with this email.'

  Scenario: Scenario 3: Successful Password Reset Email
    Given a user clicks on the 'Forgot Password' link
    When the user inputs a valid email linked to their account
    Then the system sends a password reset email with a unique nonce and user ID

  Scenario: Scenario 4: Login Attempt with Invalid Credentials
    When the user attempts to log in with an invalid email or password
    Then the system shows an error message stating 'Invalid credentials. Please try again.'

  Scenario: Scenario 5: Registration with Missing Fields
    Given the user attempts to register
    When any registration field is empty
    Then the system prompts with an error message for the missing field(s)

  Scenario: Scenario 6: Passwords Do Not Match During Registration
    Given the user is registering
    When the password and confirmation password do not match
    Then the system displays the message 'Passwords must match'

  Scenario: Scenario 7: Successful Account Creation
    Given all registration fields are filled correctly
    When the user submits the registration form
    Then the account is created and a success message appears

  Scenario: Scenario 8: Password Reset with Invalid Nonce or User ID
    Given the user clicks the link in the password reset email
    When the nonce or user ID is invalid
    Then the system shows an error message stating 'Invalid or expired link.'

  Scenario: Scenario 9: Successful Password Reset
    Given the user is on the password reset form
    When the user inputs a new password that meets the defined criteria
    Then the system confirms 'Password has been reset.'

  Scenario: Scenario 10: Password Reset without Clicking Reset Link
    Given the user has received a password reset email
    When the user does not click the link in the email
    Then the password is not reset and the user remains on the login screen.

  Scenario: Scenario 11: Password Reset with Previous Password
    Given the user is on the password reset form
    When the user inputs a new password that is the same as their previous password
    Then the system should display a message stating 'The new password cannot be the same as the old password.'
