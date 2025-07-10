Feature: Email Format Validation

  As a user
  I want to ensure that my email is valid during registration, login, and password reset
  So that I can prevent errors and succeed in my account operations

  Background:
    Given the email format must be verified against standard criteria
    And the user is attempting to perform email-related actions

  Scenario: Scenario 1: Invalid email format during registration
    Given the user enters an invalid email format
    When the user submits the registration form
    Then the system displays an error message stating 'Invalid email format'
    And the registration process is halted

  Scenario: Scenario 2: Valid email format but already in use
    Given the user enters a valid email format that already exists in the database
    When the user submits the registration form
    Then the system displays an error message stating 'Email already in use'

  Scenario: Scenario 3: Invalid email format during login
    Given the user enters an invalid email format
    When the user submits the login form
    Then the system displays an error message stating 'Invalid email format'
    And the password check is prevented

  Scenario: Scenario 4: Valid email format during password reset
    Given the user enters a valid email format
    When the user submits the password reset request
    Then the system checks if the email is linked to an account
    And the system sends a password reset email if the email is linked

  Scenario: Scenario 5: Undefined email account during password reset
    Given the user enters a valid email format that does not exist in the database
    When the user submits the password reset request
    Then the system displays an error message stating 'No account associated with this email'

  Scenario Outline: Scenario Outline: Email format validation checks
    Given the user enters an email <email>
    When the user attempts to perform an action
    Then the system determines <outcome>
    Examples:
      | email | outcome |
      | invalid-email-format | Invalid email format |
      | example@domain.com | Valid email format |
      | @missingusername.com | Invalid email format |
      | user@.com | Invalid email format |
      | user@domain | Invalid email format |
      | user@domain.com | Valid email format |

