Feature: View All Activity Fees for Bill Statement Creation

  As a user
  I want to view activity fees based on network conditions and my intention to create a bill statement
  So that I can understand the costs associated with my activities and prepare a bill if necessary

  Background:
    Given the user is logged into the system
    And the activity fees are defined in the system

  Scenario: Scenario 1: View activity fees when network is operational and intending to create a bill statement
    Given the network is operational
    And there are activity fees available
    When the user intends to create a bill statement
    Then the user should see all available activity fees
    And the user can proceed to create a bill statement

  Scenario: Scenario 2: View activity fees when network is operational and not intending to create a bill statement
    Given the network is operational
    And there are activity fees available
    When the user does not intend to create a bill statement
    Then the user should still see all available activity fees

  Scenario: Scenario 3: No activity fees available when network is operational
    Given the network is operational
    And there are no activity fees available
    When the user attempts to view activity fees
    Then the user should not see any activity fees

  Scenario: Scenario 4: Network is down but attempting to view activity fees
    Given the network is down
    When the user attempts to view activity fees
    Then the user should not see any activity fees, regardless of their intention

  Scenario: Scenario 5: View activity fees when the network is down
    Given the network is down
    When the user intends to create a bill statement
    Then the user should not see any activity fees

  Scenario: Scenario 6: No activity fees available online
    Given the network is operational
    And there are no activity fees available online
    When the user attempts to check for activity fees
    Then the user should not see any activity fees
