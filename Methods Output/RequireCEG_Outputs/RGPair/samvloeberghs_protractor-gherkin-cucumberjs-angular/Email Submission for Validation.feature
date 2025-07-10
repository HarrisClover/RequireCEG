Feature: Email Submission for Validation

  As a user who has forgotten their password
  I want to submit my email address for password reset
  So that I can receive instructions to reset my password

  Background:
    Given the user is on the login page
    And the user clicks the 'forgot password' link

  Scenario: Scenario 1: Invalid email format
    Given the user enters an invalid email format
    When the user submits the email
    Then the system displays 'The email format is invalid.'

  Scenario: Scenario 2: Non-existing account
    Given the user enters a valid email format
    And no account is found associated with the provided email
    When the user submits the email
    Then the system displays 'No account exists with that email.'

  Scenario: Scenario 3: Successful email submission
    Given the user enters a valid email format
    And the email is linked to an existing account
    When the user submits the email
    Then the system generates a unique password reset link and sends it to the provided email address.

  Scenario: Scenario 4: Email format and account existence
    Given the user enters an invalid email format
    When the user submits the email
    Then the system displays 'The email format is invalid.'
    And no account actions are triggered

  Scenario: Scenario 5: Existing account with valid email
    Given the user enters a valid email format
    And the provided email is associated with an existing account in the database
    When the user submits the email
    Then the system confirms that a password reset email has been sent.

  Scenario Outline: Scenario Outline: Email Validation Process
    Given the user enters an email '<email>'
    When the user submits the email
    Then the system should display '<response>'
    Examples:
      | email | response |
      | invalid_email_format | The email format is invalid. |
      | user@notfound.com | No account exists with that email. |
      | user@found.com | A password reset email has been sent. |

