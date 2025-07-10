Feature: Initiate Forgot Password Process

  As a user
  I want to reset my password
  So that I can regain access to my account

  Background:
    Given that the user is on the login page
    And the user has an existing account

  Scenario: Scenario 1: Submitting an Empty Email Field
    Given the user clicks the 'Forgot Password' link
    When the user submits an empty email field
    Then the system displays a message instructing the user to fill in the required email field

  Scenario: Scenario 2: Submitting an Invalid Email Format
    Given the user clicks the 'Forgot Password' link
    When the user submits an invalid email format
    Then the system displays an error message for invalid email format

  Scenario: Scenario 3: Email Not Associated with Account
    Given the user clicks the 'Forgot Password' link
    And the user enters a valid email address not linked to any account
    When the user submits the email
    Then the system informs the user that there is no account linked to that email

  Scenario: Scenario 4: Valid Email Associated with Account
    Given the user clicks the 'Forgot Password' link
    And the user enters a valid email address associated with an account
    When the user submits the email
    Then the system generates a unique nonce and user ID
    And the system sends a password reset email to the user's address
    And the system confirms that the password reset email has been sent

  Scenario: Scenario 5: Password Reset Email Sent Confirmation
    Given the user completes the password reset request with a valid email
    Then the system confirms that the password reset email has been sent
