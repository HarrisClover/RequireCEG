Feature: Account Creation

  As a user
  I want to be able to create an account and profile
  So that I can have a personalized experience in the system

  Background:
    Given the user does not have an existing account
    And the user has forgotten their account username and password

  Scenario: Scenario 1: Create an account
    Given a user is on the account creation page
    When the user provides valid information
    Then the account should be created successfully
    And the user should be redirected to the profile creation page

  Scenario: Scenario 2: Create a profile without an account
    Given a user does not have an existing account
    When the user attempts to create a profile
    Then the system should display an error message indicating that account creation is required for profile creation

  Scenario: Scenario 3: Attempt to create a profile with an invalid account
    Given the user has an existing account but does not remember their username and password
    When the user attempts to create a profile
    Then the system should display a message advising the user to recover their credentials before attempting profile creation

  Scenario Outline: Scenario Outline: Create a profile with valid account
    Given the user has an existing account with username <username>
    When the user proceeds to create a profile
    Then the profile should be created successfully
    Examples:

