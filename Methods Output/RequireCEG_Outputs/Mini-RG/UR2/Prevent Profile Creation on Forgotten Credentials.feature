Feature: Prevent Profile Creation on Forgotten Credentials

  As a user
  I want to create a profile in the system
  So that I can manage my account and preferences

  Background:
    Given a user has opened the profile creation page
    And the user does not have an account

  Scenario: Scenario 1: Profile Creation without an Account
    Given a user attempts to create a profile
    Then the system prevents profile creation
    And displays the message 'Account creation is necessary first.'

  Scenario: Scenario 2: Profile Creation with Valid Username and Incorrect Password
    Given the user has an account with a registered username
    When the user enters the correct username and incorrect password
    Then the system displays the message 'Password is incorrect.'

  Scenario: Scenario 3: Profile Creation with Non-existent Username
    Given the user attempts to create a profile with a username that does not exist
    When the user submits the profile creation request
    Then the system presents the message 'Username not found.'

  Scenario: Scenario 4: Profile Creation with Forgotten Credentials
    Given the user cannot remember their username or password
    When the user tries to create a profile
    Then the system directs the user to utilize the password recovery feature

  Scenario: Scenario 5: Profile Creation Attempt with an Invalid Account
    Given the user has opened the profile creation page
    And the user does not have a valid account
    When the user attempts to create a profile
    Then the system prevents profile creation
    And displays the message 'Account creation is necessary first.'

  Scenario: Scenario 6: Profile Creation Attempt with Correct Username and Forgotten Password
    Given the user has an account with a registered username
    When the user enters the correct username and cannot recall their password
    Then the system prompts the user to utilize the password recovery feature to retrieve credentials.
