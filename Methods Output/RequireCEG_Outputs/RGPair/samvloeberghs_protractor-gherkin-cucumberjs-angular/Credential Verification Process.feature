Feature: Credential Verification Process

  As a system user
  I want to manage my account access and password reset
  So that I can securely access my account or recover it if I forget my password

  Background:
    Given the user is on the login or registration page
    And the user has an internet connection

  Scenario: Scenario 1: Successful registration
    Given the user fills in their name, email, password, and confirm password
    When the user submits the registration form
    Then the account should be created successfully
    And the user should receive a confirmation email

  Scenario: Scenario 2: Registration with mismatched passwords
    Given the user fills in their name, email, password as 'password123', and confirm password as 'password321'
    When the user submits the registration form
    Then the user should see an error message
    And the passwords must match

  Scenario: Scenario 3: Forgot password process with valid email
    Given the user clicks on the forgot password link
    When the user enters a valid email address
    Then a validation email should be sent
    And the user should see a confirmation message

  Scenario: Scenario 4: Invalid email format during password reset
    Given the user clicks on the forgot password link
    When the user enters an invalid email address
    Then the user should see an error message
    And the message should state 'Invalid email format or email not linked to an account.'

  Scenario: Scenario 5: Successful password reset with criteria met
    Given the user clicks on the password reset link
    When the user creates a new password that meets all defined criteria
    Then the password should be updated successfully
    And the user should be able to log in with the new password

  Scenario: Scenario 6: Failed password reset due to criteria not met
    Given the user clicks on the password reset link
    When the user creates a new password that does not meet defined criteria
    Then the user should see an error message
    And the message should inform how to create a valid password

  Scenario Outline: Scenario Outline: Logging into the system
    Given the user enters a valid email <email>
    And the user enters a valid password <password>
    When the user clicks the login button
    Then the user should be granted access
    And the system should display a welcome message
    Examples:
      | email | password |
      | user@example.com | password123 |
      | admin@example.com | adminpass |

