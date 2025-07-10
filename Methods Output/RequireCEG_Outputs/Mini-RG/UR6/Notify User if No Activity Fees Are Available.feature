Feature: Notify User if No Activity Fees Are Available

  As a user of the system
  I want to view activity fees
  So that I can know what fees are available to create a bill statement

  Background:
    Given the user is logged into the system
    And the user has access to view activity fees

  Scenario: Scenario 1: Handle network connectivity issues
    Given the network connection is down
    When the user attempts to view activity fees
    Then the system should display the message 'Unable to retrieve activity fees. Please check your network connection.'

  Scenario: Scenario 2: No activity fees available
    Given the user has a stable network connection
    And there are no available activity fees
    When the user accesses the activity fees
    Then the system should display the message 'There are currently no activity fees available to view.'

  Scenario: Scenario 3: Available activity fees
    Given the user successfully accesses the activity fees
    When the user views the available fees
    Then the system should display all available activity fees.

  Scenario: Scenario 4: Create a bill statement
    Given the user indicates a desire to create a bill statement
    When the user selects specific fees to view
    Then the system provides access to some or all of the selected fees according to the user's choices.

  Scenario: Scenario 5: Accessing available fees implies selection prompt
    Given the user has successfully accessed activity fees
    When the user views the available fees
    Then the system should prompt the user to select specific fees they wish to view.

  Scenario: Scenario 6: Viewing fees despite bill statement desire
    Given the user desires to create a bill statement
    When the user accesses available fees
    Then the system should display all available activity fees regardless of the user's intention.
