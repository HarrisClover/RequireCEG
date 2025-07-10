Feature: Forgot Password Request
  As a registered user who forgot their password
  I want to request a password reset link via email
  So that I can regain access to my account.

  Scenario: Request Password Reset with Valid Registered Email
    Given a registered user exists with email "forgot@example.com"
    When the user navigates to the forgot password page
    And enters "forgot@example.com" as the email
    And submits the forgot password request
    Then the system should display a confirmation message (e.g., "If an account exists for forgot@example.com, a reset link has been sent.")
    # Verification of email sending is typically out of scope for UI Gherkin, but implied

  Scenario: Request Password Reset with Non-Registered Email
    Given the email "nonexistent@example.com" is not registered in the system
    When the user navigates to the forgot password page
    And enters "nonexistent@example.com" as the email
    And submits the forgot password request
    Then the system should display a generic confirmation message (e.g., "If an account exists for nonexistent@example.com, a reset link has been sent.")
    # Important for security not to reveal if the email exists or not

  Scenario Outline: Request Password Reset with Invalid Email Format
    Given the user navigates to the forgot password page
    When the user enters "<invalid_email>" as the email
    And submits the forgot password request
    Then the user should see an email format validation error message "<error_message>"
    And no password reset process should be initiated.

    Examples:
      | invalid_email | error_message                     |
      | plainaddress  | Please enter a valid email format. |
      | @missinguser  | Please enter a valid email format. |
      | missing@domain| Please enter a valid email format. | # (Potentially valid, depends on strictness)
      |               | Email is required.                |

