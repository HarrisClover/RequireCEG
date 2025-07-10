Feature: User Registration
  As a new user
  I want to register for an account
  So that I can log in and use the system.

  Scenario: Successful Registration
    Given the user navigates to the registration page
    And the email "newuser@example.com" is not already registered
    When the user enters "New User" as the name
    And enters "newuser@example.com" as the email
    And enters "StrongP@ssw0rd!" as the password
    And enters "StrongP@ssw0rd!" as the confirm password
    And submits the registration form
    Then the user account should be created successfully
    And the user should see a success message or be redirected to the login page/dashboard.

  Scenario Outline: Registration Validation Errors
    Given the user navigates to the registration page
    When the user enters "<name>" as the name
    And enters "<email>" as the email
    And enters "<password>" as the password
    And enters "<confirm_password>" as the confirm password
    And submits the registration form
    Then the user should see an error message "<error_message>"
    And the user account should not be created.

    Examples:
      | name      | email               | password          | confirm_password  | error_message                     | Description                     |
      |           | new@example.com     | StrongP@ssw0rd!   | StrongP@ssw0rd!   | Name is required.                 | Missing Name                    |
      | New User  |                     | StrongP@ssw0rd!   | StrongP@ssw0rd!   | Email is required.                | Missing Email                   |
      | New User  | invalid-email       | StrongP@ssw0rd!   | StrongP@ssw0rd!   | Please enter a valid email format. | Invalid Email Format            |
      | New User  | existing@example.com| StrongP@ssw0rd!   | StrongP@ssw0rd!   | Email already exists.             | Existing Email (assuming setup) |
      | New User  | new@example.com     |                   |                   | Password is required.             | Missing Password                |
      | New User  | new@example.com     | StrongP@ssw0rd!   |                   | Confirm Password is required.     | Missing Confirm Password        |
      | New User  | new@example.com     | StrongP@ssw0rd!   | MismatchedPass    | Passwords do not match.           | Password Mismatch               |
      # Add example for password policy if defined (e.g., too short)
      # | New User  | new@example.com     | short             | short             | Password does not meet criteria.  | Password Policy Violation       |