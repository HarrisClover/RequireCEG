Feature: View All Activity Fees Without Bill Statement Creation

  As a user
  I want to view activity fees while online
  So that I can make informed decisions regarding my bill statement creation

  Background:
    Given the user is online
    And the system has access to activity fees

  Scenario: Scenario 1: View all activity fees when fees are available
    Given the user is online and activity fees are available
    When the user opts to view all activities
    Then the system should display the complete list of all activity fees
    And allow the user to continue with bill statement creation

  Scenario: Scenario 2: No activity fees available
    Given the user is online and no activity fees are available
    When the user attempts to view all activities
    Then the system should display a message saying 'No activity fees are currently available.'

  Scenario: Scenario 3: Network is down
    Given the user is online but the network is down
    When the user attempts to view activity fees
    Then the system should display a message indicating that the network is unavailable.

  Scenario: Scenario 4: View specific activity fees
    Given the user is online and activity fees are available
    When the user opts to view specific activities
    Then the system should filter and display the corresponding activity fees related to the selected activities

  Scenario: Scenario 5: Attempting to view while offline
    Given the user is offline
    When the user attempts to view activity fees
    Then the system should display a message indicating that the network is unavailable.
