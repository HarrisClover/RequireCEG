Feature: Guidance for Profile Creation Process

  As a user
  I want to create a profile after validating my account
  So that I can access the personalized features of the system

  Background:
    Given the user has an existing account
    And the user is on the profile creation page

  Scenario: User attempts to create a profile without an account
    Given the user does not have an existing account
    When the user tries to create a profile
    Then the system displays the message 'You need to create an account first.'

  Scenario: User forgets username and password
    Given the user has an existing account but forgets their username or password
    When the user tries to log in
    Then the system prompts them with the message 'Please recover your account details to proceed.'

  Scenario: User logs in with correct credentials
    Given the user has an existing account and remembers their username and password
    When the user inputs their credentials
    Then they are granted access to their account
    And they can create or edit their profile

  Scenario: User logs in with incorrect credentials
    Given the user has an existing account
    When the user inputs incorrect username or password
    Then the system displays the message 'Login failed. Please check your username and password.'

  Scenario: User attempts to create a profile while logged in without a required action
    Given the user is logged in but has not recovered account details
    When the user tries to create a profile
    Then the system displays the message 'Please recover your account details to proceed.'

  Scenario: User's access is granted based on valid login and profile creation
    Given the user inputs correct username and password
    When the user attempts to create or edit their profile
    Then the user is granted access to their profile
