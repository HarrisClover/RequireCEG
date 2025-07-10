Feature: Account Creation and Profile Management

  As a potential user
  I want to create a profile only after successfully creating an account
  So that I can ensure that my profile is linked to an active account

  Background:
    Given the system checks for existing usernames in the database
    And the user is prompted to provide a username, password, and email

  Scenario: Scenario 1: Account Already Exists
    Given the user inputs a username that already exists
    When the user attempts to create a new account
    Then the system displays message A indicating the need to create a profile only after successful account creation
    And the account creation process is halted

  Scenario: Scenario 2: Account Does Not Exist
    Given the user inputs a username that does not exist
    When the user attempts to create a new account
    Then the system allows the user to proceed with account creation

  Scenario: Scenario 3: Profile Creation Without Existing Account
    Given the user attempts to create a profile without an existing account
    When the user tries to create a profile
    Then the system displays message A and halts the profile creation

  Scenario: Scenario 4: Profile Creation with Correct Credentials
    Given the user has an existing account and enters the correct username and password
    When the user attempts to create a profile
    Then the system grants permission for profile creation

  Scenario: Scenario 5: Forgotten Username or Password
    Given the user forgets their username or password
    When the user tries to create a profile
    Then the system displays message B indicating the inability to create a profile without access to an account

  Scenario: Scenario 6: Creating a Profile with Valid Credentials
    Given the user provides correct credentials (username and password)
    When the user attempts to create a profile
    Then the system allows user to create profile successfully

  Scenario: Scenario 7: Profile Creation Attempt with Invalid Additional Information
    Given the user attempts to create a profile but does not provide valid additional information
    When the user tries to create a profile
    Then the system halts profile creation process
