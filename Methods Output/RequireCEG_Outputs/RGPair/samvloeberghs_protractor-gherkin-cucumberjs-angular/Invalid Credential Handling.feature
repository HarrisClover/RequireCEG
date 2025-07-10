Feature: Invalid Credential Handling

  As a user
  I want to receive clear messages during the login process based on input validity
  So that I can understand what corrections are needed to successfully log in to my account

  Background:
    Given the login form is displayed
    And the user inputs their email and password

  Scenario: Scenario 1: Invalid email format
    Given the user enters an email with an invalid format
    Then the system displays 'Please enter a valid email address.'

  Scenario: Scenario 2: Email not associated with any account
    Given the user enters a valid email format that is not associated with an account
    Then the system displays 'No account found with this email address.'

  Scenario: Scenario 3: Incorrect password
    Given the user enters a valid email associated with an account
    And the password entered is incorrect
    Then the system displays 'Incorrect password. Please try again.'

  Scenario: Scenario 4: Password reset attempt with no associated account
    Given the user enters a valid email format that is not associated with any account
    When the user initiates a password reset
    Then the system displays 'If this email is associated with an account, you will receive instructions to reset your password.'

  Scenario: Scenario 5: Empty email or password fields
    Given the user leaves the email or password field empty
    Then the system displays 'Email and Password are required fields.'

  Scenario: Scenario 6: Valid email but empty password field
    Given the user enters a valid email
    And the password field is empty
    Then the system displays 'Email and Password are required fields.'

  Scenario: Scenario 7: Valid email with correct password
    Given the user enters a valid email associated with an account
    And the password entered is correct
    When the user attempts to log in
    Then the system logs the user in
