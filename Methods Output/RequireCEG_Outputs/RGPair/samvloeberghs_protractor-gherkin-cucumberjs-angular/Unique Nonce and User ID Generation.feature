Feature: Unique Nonce and User ID Generation

  As a user requesting a password reset
  I want to receive a secure link that allows me to reset my password
  So that I can safely regain access to my account

  Background:
    Given a user has forgotten their password
    And the system is ready to handle password reset requests

  Scenario: Valid nonce and user ID
    Given the system has generated a unique nonce for the user
    When the user clicks on the reset password link with the valid nonce
    Then the system retrieves the user ID linked to that nonce
    And the user is granted access to the password reset form

  Scenario: Invalid nonce
    Given the user clicks on a reset password link with an invalid nonce
    Then the system displays an error message 'The link is invalid'

  Scenario: Expired nonce
    Given the user attempts to use an expired nonce
    Then the system informs the user with a message 'The reset request is no longer valid, please initiate a new forgot password request.'

  Scenario: Access denied on invalid nonce
    Given the user clicks on a reset password link with an invalid nonce
    Then the system displays an error message 'The link is invalid'

  Scenario: Access denied on expired nonce
    Given the user attempts to use an expired nonce
    Then the system informs the user with a message 'The reset request is no longer valid, please initiate a new forgot password request.'

  Scenario Outline: Nonce validation scenarios
    Given the system has a nonce associated with user ID '<userID>'
    And the nonce validity is '<nonceStatus>'
    When the user uses the nonce '<nonce>' to access the reset form
    Then the outcome should be '<expectedOutcome>'
    Examples:
      | userID | nonceStatus | nonce | expectedOutcome |
      | user123 | valid | nonce123 | granted access to password reset form |
      | user456 | invalid | nonceXYZ | The link is invalid |
      | user789 | expired | nonceExpired | The reset request is no longer valid, please initiate a new forgot password request. |

