Feature: Re-login Capability with Valid Credentials

  As a user
  I want to be able to log back into the system using my valid credentials
  So that I can access my account without additional steps

  Background:
    Given the user has previously logged into their Gmail account
    And the user has logged out of the system

  Scenario: Successful login with valid credentials
    Given the username input field is visible
    And the user enters valid username credentials
    When the user clicks the login button
    Then the system checks the credentials against the stored data
    And the system displays the logout link indicating successful login

  Scenario: Unsuccessful login with invalid credentials
    Given the username input field is visible
    When the user enters invalid username credentials
    Then the system presents an error message stating 'Credentials are incorrect'
    And the username input field remains visible for another entry attempt

  Scenario: Logout link visibility after successful login
    Given the user has logged out
    When the user enters valid username credentials and clicks the login button
    Then the system displays the logout link indicating successful login
    And the logout link remains visible

  Scenario: Visibility of username input field after failed login
    Given the username input field is visible
    When the user enters invalid username credentials and clicks the login button
    Then the system presents an error message stating 'Credentials are incorrect'
    And the username input field remains visible for another entry attempt
