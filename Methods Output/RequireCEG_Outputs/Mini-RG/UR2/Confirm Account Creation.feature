Feature: Confirm Account Creation

  As a user
  I want to create an account and a profile
  So that I can access personalized features of the system

  Background:
    Given the user is on the account creation page
    And the user has not previously created an account

  Scenario: Scenario 1: Successful Account Creation
    Given the user does not have an account
    When the user attempts to create an account
    Then the account is successfully created
    And the user can proceed to create a profile

  Scenario: Scenario 2: Attempt to Create Profile without an Account
    Given the user does not have an account
    When the user tries to create a profile
    Then the system prompts with the message 'You must create an account first.'

  Scenario: Scenario 3: Attempt to Create Profile without Credentials
    Given the user has an account but does not remember the credentials
    When the user tries to create a profile
    Then the system displays the message 'Cannot proceed without correct username and password.'

  Scenario: Scenario 4: Creating a Profile with Valid Credentials
    Given the user has valid credentials and an account
    When the user attempts to create a profile
    Then the profile creation is successful

  Scenario: Scenario 5: Allow Profile Creation on Account Existence
    Given the user has an account but does not have a profile
    When the user attempts to create a profile
    Then the profile is created successfully
    And the system allows it

  Scenario Outline: Scenario Outline: Profile Creation with Account
    Given the user has an account with username '<username>' and password '<password>'
    And there is no existing profile
    When the user fills in the profile creation form
    Then the profile is created successfully
    Examples:
      | username | password |
      | john_doe | securePassword123 |
      | jane_smith | mySecretPassword |

