Feature: Error Messaging for User Guidance

  As a user
  I want to receive appropriate feedback during authentication processes
  So that I can understand and resolve any issues I encounter

  Background:
    Given the user is on the authentication page
    And the user wants to perform an action such as login, registration, or password reset

  Scenario: Forgot Password with Invalid Email Format
    Given the user enters an invalid email
    When the user submits the forgot password request
    Then the system should display 'Please enter a valid email address.'

  Scenario: Forgot Password with Valid Email Not Associated
    Given the user enters a valid email that is not registered
    When the user submits the forgot password request
    Then the system should display 'This email is not associated with any account.'

  Scenario: Login with Invalid Credentials
    Given the user attempts to log in with an invalid email or password
    When the user submits the login form
    Then the system should display 'Invalid email or password. Please try again.'

  Scenario: Registration with Non-matching Passwords
    Given the user enters two passwords that do not match
    When the user submits the registration form
    Then the system should display 'Passwords do not match. Please re-enter your password.'

  Scenario: Registration with Missing Fields
    Given the user leaves one or more required fields empty
    When the user attempts to register
    Then the system should display 'All fields are required.'

  Scenario: Password Reset with Invalid Nonce or User ID
    Given the user provides an invalid nonce or user ID during the reset process
    When the user submits the password reset request
    Then the system should display 'Invalid request. Please check your email or request a new link.'

  Scenario: Setting New Password with Insufficient Length
    Given the user enters a new password that is less than 8 characters
    When the user attempts to set the new password
    Then the system should display 'Password must be at least 8 characters long.'

  Scenario: Setting New Password with Mismatched Confirmation
    Given the user enters a new password and a confirmation that does not match
    When the user submits the new password
    Then the system should display 'New password and confirmation do not match. Please try again.'

  Scenario: Registration with Missing Required Fields
    Given the user has all required fields empty
    When the user attempts to register
    Then the system should display 'All fields are required.'

  Scenario: Forgot Password with Valid Email Format
    Given the user enters a valid email format
    When the user submits the forgot password request
    Then the system should proceed to check if the email is associated with an account.
