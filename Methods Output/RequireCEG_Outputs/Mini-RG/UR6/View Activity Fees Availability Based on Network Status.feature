Feature: View Activity Fees Availability Based on Network Status

  As a user
  I want to view activity fees online based on network availability
  So that I can understand my billing options and any applicable fees

  Background:
    Given the user is logged into the system
    And the activity fees are properly configured in the system

  Scenario: Scenario 1: Network is up and user plans to create a bill statement
    Given the network is up
    And the user intends to create a bill statement
    When the user requests to view activity fees
    Then the system displays all available activity fees
    And the user can review all fees online

  Scenario: Scenario 2: Network is up and user does not plan to create a bill statement
    Given the network is up
    And the user does not intend to create a bill statement
    When the user requests to view activity fees
    Then the system displays all available activity fees
    And the user can review all fees online

  Scenario: Scenario 3: Network is down
    Given the network is down
    When the user tries to access activity fees
    Then the system shows an error message 'Network is currently unavailable. Please try again later.'

  Scenario: Scenario 4: No activity fees available
    Given the network is up
    And there are no activity fees available in the system
    When the user requests to view activity fees
    Then the system shows a message 'There are no activity fees available to view'

  Scenario: Scenario 5: User intends to create a bill statement but there are no activity fees
    Given the network is up
    And the user intends to create a bill statement
    And there are no activity fees available in the system
    When the user requests to view activity fees
    Then the system shows a message 'There are no activity fees available to view.'
