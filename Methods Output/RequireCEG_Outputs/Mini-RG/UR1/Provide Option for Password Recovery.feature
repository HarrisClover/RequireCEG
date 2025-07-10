Feature: Provide Option for Password Recovery

  As a registered user
  I want to recover my password when I forget it
  So that I can regain access to my account

  Background:
    Given the user is on the login page
    And the user clicks the 'Forgot Password' link

  Scenario: Scenario 1: Invalid Email Format
    Given the user enters an invalid email format
    When the user submits the email
    Then the system displays an error message indicating that the email format is incorrect

  Scenario: Scenario 2: Unregistered Email
    Given the user enters a valid email format
    And the email is not associated with any registered user
    When the user submits the email
    Then the system displays an error message stating that the email is not recognized

  Scenario: Scenario 3: Valid Email and Password Recovery Email Sent
    Given the user enters a valid registered email address
    When the user submits the email
    Then the system sends a password recovery email to the user's address with instructions

  Scenario: Scenario 4: Password Reset Failure
    Given the user receives the recovery email
    When the user attempts to reset the password with invalid criteria
    Then the system provides an error message indicating password reset failure
    And the system gives the user the option to try again or seek further assistance

  Scenario: Scenario 5: Successful Password Reset
    Given the user receives the recovery email
    When the user successfully resets their password
    Then the system confirms the successful reset and allows the user to log in using the new password

  Scenario: Scenario 6: Incorrect Email Format Displays Validation Error
    Given the user enters an email address that does not conform to the required format
    Then the system validates the email address format
    And the system displays an error message indicating that the email format is incorrect

  Scenario: Scenario 7: Registered Email Verification
    Given the user enters an email address that is associated with a registered user
    When the system checks the database for the email address
    Then the system displays an error message stating that the email is not recognized

  Scenario: Scenario 8: Email Submission with Non-Matching User
    Given the user enters an email address that is not found in the database
    When the user submits the email
    Then the system displays an error message stating that the email is not recognized
