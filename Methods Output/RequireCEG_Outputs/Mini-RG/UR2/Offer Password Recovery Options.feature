Feature: Offer Password Recovery Options

  As a user who has forgotten account details
  I want to recover my username or password
  So that I can access my account and create a profile

  Background:
    Given the user does not have access to their account
    And the user attempts to create a profile

  Scenario: User tries to create a profile without an existing account
    Given the user is on the profile creation page
    When the user submits the profile creation form
    Then the system should display a message indicating that an account must be created first

  Scenario: User cannot remember username or password
    Given the user is on the account creation page
    When the user selects the option to recover username or password
    Then the system should prompt with available options for recovery

  Scenario: User selects password recovery option
    Given the user has selected the password recovery option
    When the system generates a password recovery link
    Then the system sends the link to the registered email address

  Scenario: User successfully resets their password
    Given the user received the password recovery link
    When the user follows the link and resets their password
    Then the system allows them to proceed with creating their account

  Scenario: User cannot remember username during recovery
    Given the user opts for username recovery
    When the user provides insufficient information
    Then the system should display a message indicating they need to retrieve their username

  Scenario: User attempts to create a profile after recovery
    Given the user has successfully recovered their password
    And the user has access to their account
    When the user attempts to create a profile
    Then the system should allow the user to create a profile

  Scenario: User cannot proceed without username retrieval
    Given the user cannot remember their username for recovery
    When the user tries to recover the username
    Then the system should display a message indicating that the user needs to retrieve their username before they can continue
