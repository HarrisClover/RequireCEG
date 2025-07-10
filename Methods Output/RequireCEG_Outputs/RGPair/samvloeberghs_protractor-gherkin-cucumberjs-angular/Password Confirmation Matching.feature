Feature: Password Confirmation Matching

  As a user attempting to create an account or reset a password
  I want to ensure that my entered password and confirmation password match
  So that I can successfully register or reset my password without errors

  Background:
    Given the user is on the account registration or password reset page
    And the user has entered a password and a confirmation password

  Scenario: Scenario 1: Passwords do not match during registration
    Given the user enters a password as 'password123'
    And the user enters a confirmation password as 'password456'
    When the user attempts to register the account
    Then an error message is displayed stating 'The passwords must match.'
    And the registration process is halted

  Scenario: Scenario 2: Password meets criteria during registration
    Given the user enters a password as 'strongPassword1!'
    And the user enters a confirmation password as 'strongPassword1!'
    When the user attempts to register the account
    Then the registration is successful

  Scenario: Scenario 3: New password does not match confirmation during reset
    Given the user enters a new password as 'newpassword123'
    And the user enters a confirmation password as 'differentpassword456'
    When the user attempts to reset the password
    Then an error message is displayed stating 'The passwords must match.'

  Scenario: Scenario 4: Password does not meet minimum length requirement
    Given the user enters a password as 'abc'
    And the user enters a confirmation password as 'abc'
    When the user attempts to register the account
    Then the system displays a message specifying the required conditions for the password

  Scenario: Scenario 5: Passwords must match when resetting
    Given the user enters a new password as 'passwordABC'
    And the user enters a confirmation password as 'NOTmatch'
    When the user attempts to reset the password
    Then an error message is displayed stating 'The new passwords must match.'
