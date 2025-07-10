Feature: Validate User Credentials

  As a user
  I want to log in to my account
  So that I can access my profile and manage my information

  Background:
    Given that the user has an existing account
    And the user knows their username and password

  Scenario: Successful login with valid credentials
    Given the user inputs the correct username
    And the user inputs the correct password
    When the user attempts to log in
    Then the user is granted access to their account
    And the user can create or update their profile

  Scenario: Unsuccessful login with invalid credentials
    Given the user inputs an incorrect username or password
    When the user attempts to log in
    Then the system displays a message indicating invalid credentials

  Scenario: Account creation option for non-existing users
    Given the user does not have an existing account
    When the user attempts to log in
    Then the user is shown an option to create an account

  Scenario: Password retrieval for forgotten credentials
    Given the user cannot remember their username or password
    When the user attempts to log in
    Then the user is prompted to retrieve or reset their password

  Scenario Outline: Credential validation attempts
    Given the user inputs the username as <username>
    And the user inputs the password as <password>
    When the user attempts to log in
    Then the system responds with <response>
    Examples:
      | username | password | response |
      | validUser | validPass | access granted |
      | invalidUser | validPass | invalid credentials |
      | validUser | invalidPass | invalid credentials |
      | invalidUser | invalidPass | invalid credentials |

