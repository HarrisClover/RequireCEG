Feature: Password Strength Validation

  As a user registering or resetting their password
  I want to ensure that my password meets security requirements
  So that my account is protected from unauthorized access

  Background:
    Given the user is on the registration or password reset page
    And the user has entered their password and confirm password

  Scenario: Password too short
    Given the user inputs a password of less than 8 characters
    Then the system displays 'Password must be at least 8 characters long.'

  Scenario: Missing uppercase letter
    Given the user inputs a password with no uppercase letters
    Then the system displays 'Password must include at least one uppercase letter.'

  Scenario: Missing lowercase letter
    Given the user inputs a password with no lowercase letters
    Then the system displays 'Password must include at least one lowercase letter.'

  Scenario: Missing numeric character
    Given the user inputs a password with no numeric characters
    Then the system displays 'Password must include at least one number.'

  Scenario: Missing special character
    Given the user inputs a password without special characters
    Then the system displays 'Password must include at least one special character.'

  Scenario: Passwords do not match
    Given the user inputs a password and a confirm password that do not match
    Then the system displays 'Passwords do not match. Please try again.'

  Scenario: Valid password
    Given the user inputs a password that meets all criteria
    When the user submits the registration or password reset form
    Then the user is allowed to proceed with their registration or password reset

  Scenario: Password too short and invalid
    Given the user inputs a password of less than 8 characters
    And the user inputs a confirm password of less than 8 characters
    Then the system displays 'Password must be at least 8 characters long.'
