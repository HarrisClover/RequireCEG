Feature: Verify Account Existence Before Profile Creation

  As a user attempting to create a profile
  I want to verify if an account already exists
  So that I can avoid issues during profile creation

  Background:
    Given the user is on the profile creation page
    And the user has not yet provided account credentials

  Scenario: Scenario 1: Account creation required
    Given the user tries to create a profile
    When no existing account is found
    Then the system should display 'Account creation is required – please create an account to proceed.'

  Scenario: Scenario 2: Recovering username or password
    Given the user has an existing account
    When the user cannot remember their username or password
    Then the system should prevent profile creation
    And prompt the user with the message 'Unable to create profile. Please recover your username or password before proceeding.'

  Scenario: Scenario 3: Successful profile creation
    Given the user has an existing account
    And the user recalls their account credentials
    When the user validates their username and password
    Then the user will be allowed to create a profile
    And the system should display 'Profile created successfully.'

  Scenario: Scenario 4: Valid credentials check
    Given the user has an existing account
    And the user remembers their username and password
    When the user validates the provided username and password
    Then the system should allow the user to proceed with creating their profile
    And the profile creation should be confirmed as valid.

  Scenario: Scenario 5: Invalid credentials check
    Given the user has an existing account
    When the user provides invalid username or password
    Then the system should prevent profile creation
    And display the message 'Unable to create profile. Please recover your username or password before proceeding.'
