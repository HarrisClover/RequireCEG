Feature: Password Reset Using Link
  As a user who has requested a password reset
  I want to set a new password using the link from the email
  So that I can log in with my new credentials.

  Background: Valid Reset Token
    Given a user has requested a password reset for their account "reset@example.com"
    And the system has generated a valid, unique password reset link containing a nonce and user ID
    And the user clicks on this valid password reset link

  Scenario: Successfully Setting a New Password
    When the user is directed to the password reset page
    And enters "NewSecureP@ss1" as the new password
    And enters "NewSecureP@ss1" as the confirm new password
    And submits the password reset form
    Then the user's password should be updated successfully
    And the user should see a success message "Your password has been reset successfully."
    And the password reset link should become invalid.

  Scenario: Attempting Reset with Mismatched Passwords
    When the user is directed to the password reset page
    And enters "NewSecureP@ss1" as the new password
    And enters "DifferentP@ss2" as the confirm new password
    And submits the password reset form
    Then the user should see an error message "Passwords do not match."
    And the user's password should not be updated.

  Scenario Outline: Attempting Reset with Password Policy Violations
    When the user is directed to the password reset page
    And enters "<invalid_password>" as the new password
    And enters "<invalid_password>" as the confirm new password
    And submits the password reset form
    Then the user should see an error message "<error_message>"
    And the user's password should not be updated.

    Examples:
      # These depend on the specific password policy rules
      | invalid_password | error_message                                     | Description      |
      | short            | Password must be at least X characters long.      | Too Short        |
      | NOPASSWORD       | Password must include numbers and special chars.  | Lacks Complexity |
      # Add more examples based on actual password rules (e.g., requires uppercase, lowercase, number, symbol)

  Scenario: Attempting to Use an Invalid or Expired Reset Link
    Given the user attempts to access a password reset link that is invalid or expired
    When the user navigates using the invalid/expired link
    Then the user should be shown an error page or message indicating "This password reset link is invalid or has expired."
    And the user should not see the password reset form.