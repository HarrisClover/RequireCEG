Feature: User Login
  As a user
  I want to log into the system securely
  So that I can access my account and system features.

  Scenario: Successful Login
    Given a registered user exists with email "test@example.com" and password "ValidPassword123"
    When the user navigates to the login page
    And enters "test@example.com" as the email
    And enters "ValidPassword123" as the password
    And clicks the login button
    Then the user should be successfully logged into the system
    And redirected to their dashboard or designated landing page.

  Scenario Outline: Unsuccessful Login Attempts
    Given the user navigates to the login page
    When the user enters "<email>" as the email
    And enters "<password>" as the password
    And clicks the login button
    Then the user should see an error message "<error_message>"
    And the user should remain on the login page or see the login form again.

    Examples:
      | email              | password          | error_message                     | Description                     |
      | test@example.com   | WrongPassword     | Invalid email or password.        | Correct email, wrong password   |
      | nonexist@example.com | AnyPassword       | Invalid email or password.        | Non-existent email            |
      | test@example.com   |                   | Password is required.             | Missing password                |
      |                    | ValidPassword123  | Email is required.                | Missing email                   |
      | invalid-email      | AnyPassword       | Please enter a valid email format. | Invalid email format            |