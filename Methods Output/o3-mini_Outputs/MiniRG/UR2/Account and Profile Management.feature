Feature: Account and Profile Management

  As a user,
  I want to be able to create an account and manage my profile,
  So that I can securely access and maintain my personal information.

  Scenario: Create an account when one does not exist
    Given the user does not have an existing account
    When the user navigates to the registration page
    And the user submits valid account details
    Then a new account is successfully created
    And a confirmation message is displayed

  Scenario: Create a profile when the account exists
    Given the user has a valid account
    And the user is logged into the system
    When the user navigates to the profile creation page
    And the user submits valid profile information
    Then the profile is created successfully
    And the user is redirected to their profile page

  Scenario: Prevent profile creation without an account
    Given the user does not have a valid account
    When the user attempts to access the profile creation page
    Then the system prevents access to the profile creation page
    And displays a message instructing the user to create an account first

  Scenario: Prevent profile creation when account credentials are forgotten
    Given the user has an account but does not remember the username or password
    When the user attempts to log in to create a profile
    Then the system denies access
    And the system prompts the user to recover or reset their account credentials
