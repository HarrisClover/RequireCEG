Feature: Input Validation for Registration

  As a user trying to register
  I want to ensure that my email and password fields are valid
  So that I can successfully register for my account

  Background:
    Given the system is ready for user registration
    And the user is on the registration page

  Scenario: Scenario 1: Valid registration
    Given the user enters a valid email address 'user@example.com'
    And the user enters a password 'password123'
    And the user confirms the password 'password123'
    When the user submits the registration form
    Then the system should display 'Registration successful! Redirecting to login page...'

  Scenario: Scenario 2: Invalid email format
    Given the user enters an invalid email address 'userexample.com'
    When the user submits the registration form
    Then the system should display 'Please enter a valid email address.'

  Scenario: Scenario 3: Empty password field
    Given the user enters a valid email address 'user@example.com'
    And the user leaves the password field empty
    When the user submits the registration form
    Then the system should display 'Password cannot be empty.'

  Scenario: Scenario 4: Password too short
    Given the user enters a valid email address 'user@example.com'
    And the user enters a password 'short'
    When the user submits the registration form
    Then the system should display 'Password must be at least 8 characters long.'

  Scenario: Scenario 5: Passwords do not match
    Given the user enters a valid email address 'user@example.com'
    And the user enters a password 'password123'
    And the user confirms the password 'password'
    When the user submits the registration form
    Then the system should display 'Passwords do not match.'

  Scenario: Scenario 6: Password field is empty
    Given the user enters a valid email address 'user@example.com'
    And the user leaves the password field empty
    When the user submits the registration form
    Then the system should display 'Password cannot be empty.'

  Scenario: Scenario 7: Confirmed password does not match
    Given the user enters a valid email address 'user@example.com'
    And the user enters a password 'password123'
    And the user confirms the password 'differentPassword'
    When the user submits the registration form
    Then the system should display 'Passwords do not match.'
