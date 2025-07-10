Feature: Nonce and ID Validation

  As a user requesting to reset their password
  I want to validate the password reset link
  So that I can securely reset my password if the link is valid

  Background:
    Given the user has requested a password reset
    And the system has generated a password reset link with a nonce and user ID

  Scenario: Invalid nonce
    Given the user receives a password reset link with an invalid nonce
    When the user attempts to access the link
    Then the system should display 'Invalid password reset link. Please request a new link.'

  Scenario: Non-existent user ID
    Given the user receives a password reset link with a valid nonce and a non-existent user ID
    When the user attempts to access the link
    Then the system should display 'No account associated with this email.'

  Scenario: Valid nonce and user ID
    Given the user receives a password reset link with a valid nonce and an existing user ID
    When the user accesses the password reset form
    Then the system should allow access to the password reset form

  Scenario: Successful password reset
    Given the user is on the password reset form
    When the user enters a new password that meets the specified criteria and matches the confirm password field
    Then the system should update the user's password in the database
    And the system should display 'Your password has been reset. You can now log in with your new password.'

  Scenario: Password criteria validation
    Given the user is on the password reset form
    When the user enters a new password that does not meet the criteria
    Then the system should present an error message about the password criteria

  Scenario: Password mismatch
    Given the user is on the password reset form
    When the user enters a new password and a mismatched confirm password
    Then the system should present an error message saying 'Passwords do not match. Please try again.'

  Scenario: Invalid Password Reset without Nonce
    Given the user attempts to access the password reset form without providing a nonce
    When the user submits the form
    Then the system should display 'Invalid password reset link. Please request a new link.'

  Scenario: Password Reset with Mismatched Nonce and User ID
    Given the user receives a password reset link with a valid nonce but a non-existent user ID
    When the user attempts to access the link
    Then the system should display 'No account associated with this email.'
