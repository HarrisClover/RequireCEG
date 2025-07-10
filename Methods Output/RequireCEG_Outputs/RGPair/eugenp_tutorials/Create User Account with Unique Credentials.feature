Feature: Create User Account with Unique Credentials

  As a user
  I want to create an account with a unique username and a secure password
  So that I can access the system safely and securely

  Background:
    Given the user is on the account creation page
    And the user has valid username and password requirements

  Scenario: Valid account creation
    Given a unique username is provided
    And a password that meets the security requirements is provided
    When the user submits the account creation form
    Then the account should be created successfully
    And a confirmation message 'Account created successfully!' should be displayed

  Scenario: Username already taken
    Given a username that already exists in the database is provided
    When the user submits the account creation form
    Then the system should display 'Username is taken, please choose another one.'

  Scenario: Password does not meet requirements
    Given a unique username is provided
    And a password that does not meet security requirements is provided
    When the user submits the account creation form
    Then the system should display 'Password must meet security requirements; please try again.'

  Scenario: Empty username field
    Given the username field is left empty
    When the user submits the account creation form
    Then the system should display 'Please fill in all required fields.'

  Scenario: Empty password field
    Given the password field is left empty
    When the user submits the account creation form
    Then the system should display 'Please fill in all required fields.'

  Scenario Outline: Scenario Outline: Unique Credentials Validation
    Given a username is '<username>'
    And a password is '<password>'
    When the user attempts to create an account
    Then the outcome should be '<outcome>'
    Examples:
      | username | password | outcome |
      | existingUser | ValidP@ss1 | Username is taken, please choose another one. |
      | uniqueUser | weakpass | Password must meet security requirements; please try again. |
      | uniqueUser |  | Please fill in all required fields. |
      |  | ValidP@ss1 | Please fill in all required fields. |

