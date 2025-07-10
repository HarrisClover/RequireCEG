Feature: Email Format and Account Validation

  As a user
  I want the system to validate my email address during registration and password recovery
  So that I can ensure that my email is properly formatted and linked to an account

  Background:
    Given the user is on the registration or password recovery page
    And the system is ready to validate email addresses

  Scenario: Scenario 1: Invalid email format during password recovery
    Given the user enters an invalid email format 'user@domain'
    When the user submits the forgot password request
    Then the system displays 'Please enter a valid email address.'

  Scenario: Scenario 2: Valid email with no associated account during password recovery
    Given the user enters a valid email format 'user@domain.com'
    And the email is not associated with any account
    When the user submits the forgot password request
    Then the system displays 'No account found with this email address.'

  Scenario: Scenario 3: Valid email with existing account during password recovery
    Given the user enters a valid email format 'user@domain.com'
    And the email is associated with an existing account
    When the user submits the forgot password request
    Then the system sends a password reset email to 'user@domain.com'

  Scenario: Scenario 4: Invalid email format during registration
    Given the user enters an invalid email format 'user@domain'
    When the user submits the registration form
    Then the system displays 'Please enter a valid email address.'

  Scenario: Scenario 5: Valid email already registered during registration
    Given the user enters a valid email format 'user@domain.com'
    And the email is already registered
    When the user submits the registration form
    Then the system displays 'This email address is already registered.'

  Scenario: Scenario 6: Valid email not registered during registration
    Given the user enters a valid email format 'user@domain.com'
    And the email is not registered
    When the user submits the registration form
    Then the system allows the user to continue with the registration process

  Scenario: Scenario 7: Valid email format with no associated account during password recovery
    Given the user enters a valid email format 'user@domain.com'
    And the email is not associated with any account
    When the user submits the forgot password request
    Then the system displays 'No account found with this email address.'

  Scenario: Scenario 8: Valid email format already registered during registration
    Given the user enters a valid email format 'user@domain.com'
    And the email is already registered during registration
    When the user submits the registration form
    Then the system displays 'This email address is already registered.'

  Scenario: Scenario 9: Valid email format not registered during registration
    Given the user enters a valid email format 'user@domain.com'
    And the email is not already registered during registration
    When the user submits the registration form
    Then the system allows the user to continue with the registration process.
