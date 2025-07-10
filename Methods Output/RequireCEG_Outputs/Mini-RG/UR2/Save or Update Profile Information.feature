Feature: Save or Update Profile Information

  As a user of the system
  I want to create or update my profile information
  So that I can ensure my contact details are current and receive notifications

  Background:
    Given the user has logged into the system
    And the user has valid account credentials

  Scenario: Scenario 1: Successfully update profile information
    Given the user navigates to the profile update section
    And the user inputs valid profile information
    When the user submits the updated profile information
    Then the profile updates successfully
    And a confirmation message is displayed

  Scenario: Scenario 2: Attempt to update profile with invalid email
    Given the user navigates to the profile update section
    When the user inputs an incorrectly formatted email address
    Then an error message is presented specifying the email format issue

  Scenario: Scenario 3: Attempt to update profile with missing mandatory fields
    Given the user navigates to the profile update section
    When the user leaves mandatory fields blank
    Then an error message is displayed indicating which fields are mandatory

  Scenario: Scenario 4: Log in without an existing account and create a new one if prompted for account creation during login attempt due to no account existence or valid credentials forgotten requirements in the scenario outlines above.
    Given the user does not have an existing account
    When the user attempts to log in
    Then the user is prompted to create an account with a link to the account creation page

  Scenario: Scenario 5: Display instructions for credential recovery when the user has an account but forgot their credentials.
    Given the user has an account but does not remember their username or password
    When the user attempts to log in
    Then the instructions for credential recovery are displayed.

  Scenario Outline: Scenario Outline: Account registration requirement
    Given the user does not have an existing account
    And the user attempts to log in
    When the system detects the absence of an account
    Then the user is prompted to create an account with a link to the account creation page
    Examples:
      | User State | Action | Prompt |
      | does not have an account | attempts to log in | Prompt to create account with link |
      | has an account but forgot credentials | attempts to log in | Instructions for credential recovery |

