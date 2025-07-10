Feature: Authentication Component

  # Forgot Password Process
  Scenario Outline: Forgot Password Request - Valid and Invalid Email Scenarios
    Given a user is on the login page
    When the user clicks on the "Forgot Password" link
    And the user submits the email "<email>"
    Then the system validates the email format
    And if the email is in the correct format and linked to an existing account, the system sends a password reset link
    And if the email is invalid or not linked to any account, the system displays an appropriate error message

    Examples:
      | email                |
      | user@example.com     |
      | invalid-email        |
      | unknown@example.com  |

  # Login Functionality
  Scenario Outline: User Login with Valid and Invalid Credentials
    Given a user is on the login page
    When the user enters email "<email>" and password "<password>"
    Then the system verifies the credentials
    And if the credentials are correct, the user is successfully logged in
    And if the credentials are incorrect, the system rejects the login attempt with an error message

    Examples:
      | email              | password    |
      | user@example.com   | correct123  |
      | user@example.com   | wrongpass   |

  # Registration Process
  Scenario Outline: User Registration with Complete and Valid Inputs
    Given a user is on the registration page
    When the user enters name "<name>", email "<email>", password "<password>" and confirms the password with "<confirm_password>"
    Then the system checks that all required fields are filled in and that the email format is valid
    And the system verifies that the password and confirmation match
    And if all validations pass, the system registers the user successfully
    And if any validation fails, the system displays the relevant error message

    Examples:
      | name        | email              | password    | confirm_password |
      | John Doe    | john@example.com   | Pass1234!   | Pass1234!        |
      | Jane Smith  | jane_at_example.com| Pass1234!   | Pass1234!        |
      | Bob Brown   | bob@example.com    | Pass1234!   | wrongpass        |

  # Password Reset Functionality
  Scenario Outline: Password Reset with Valid Link and Matching New Passwords
    Given a user has received a password reset email with a unique nonce "<nonce>" and user identifier "<user_id>"
    And the user clicks the password reset link
    When the system validates the nonce and user identifier
    And the user enters a new password "<new_password>" and confirms it with "<confirm_new_password>"
    Then the system checks that the new password meets the defined criteria (such as length and complexity) and that both entries match
    And if all validations pass, the system successfully updates the password
    And if the validations fail, the system returns an appropriate error message

    Examples:
      | nonce      | user_id | new_password | confirm_new_password |
      | abc123xyz  | 001     | NewPass!2025 | NewPass!2025         |
      | def456uvw  | 002     | short       | short                |
      | ghi789rst  | 003     | ValidPass#1 | ValidPass#2          |
