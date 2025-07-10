Feature: New Password Input and Confirmation

  As a user
  I want to reset my password securely
  So that I can regain access to my account with a new, compliant password

  Background:
    Given the user has a valid nonce and user ID
    And the user is on the password reset page

  Scenario: Scenario 1: Valid Password Reset
    Given the user enters a new password that meets all criteria
    And the user enters a matching confirmation password
    When the user submits the new password
    Then the user’s password should be updated successfully
    And a success message should be displayed

  Scenario: Scenario 2: Invalid Nonce or User ID
    Given the user has an invalid nonce or user ID
    When the user tries to access the password reset link
    Then the system should display 'The password reset link is no longer valid.'

  Scenario: Scenario 3: New Password Does Not Meet Criteria
    Given the user enters a new password that does not meet the criteria
    When the user submits the new password
    Then the system should display an error message detailing the requirements that were not met

  Scenario: Scenario 4: Confirmation Password Does Not Match
    Given the user enters a new password that meets the criteria
    And the user enters a confirmation password that does not match
    When the user submits the passwords
    Then the system should display 'The passwords must match.'

  Scenario: Scenario 5: Password Reset Link Accessibility
    Given the user has a valid nonce and user ID
    When the user accesses the password reset link
    Then the password reset link should be accessible

  Scenario: Scenario 6: Password Criteria Failure
    Given the user enters a new password '<new-password>'
    When the user submits the new password
    Then the system should validate the password against the criteria '<expectation>'
