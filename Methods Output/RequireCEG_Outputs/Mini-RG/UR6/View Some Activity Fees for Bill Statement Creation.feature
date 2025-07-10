Feature: View Some Activity Fees for Bill Statement Creation

  As a user
  I want to view activity fees online based on my intention to create a bill statement
  So that I can manage my billing effectively

  Background:
    Given the user is logged into the system
    And the network status is either operational or down

  Scenario: Creating a bill statement with operational network
    Given the user intends to create a bill statement
    And the network is operational
    When the user requests to view activity fees
    Then the user should see all available activity fees online

  Scenario: Viewing fees without intention to create a bill statement with operational network
    Given the user does not intend to create a bill statement
    And the network is operational
    When the user requests to view activity fees
    Then the user should still be able to view all available activity fees

  Scenario: Network down when user intends to create a bill statement
    Given the user intends to create a bill statement
    And the network is down
    When the user requests to view activity fees
    Then the system should display an error message indicating that no activity fees can be viewed

  Scenario: Viewing fees when there are no activity fees available
    Given the user intends to view activity fees
    And there are no activity fees available online
    When the user requests to view activity fees
    Then the system should inform the user that no activity fees are available for viewing

  Scenario: User attempts to view fees when network is down and no activity fees are available
    Given the user intends to create a bill statement
    And the network is down
    And there are no activity fees available online
    When the user requests to view activity fees
    Then the system should display an error message indicating that no activity fees can be viewed
    And the system should inform the user that no activity fees are available for viewing

  Scenario Outline: User interaction with varying network conditions and intentions
    Given the user intends to create a bill statement
    And the network status is <network-status>
    When the user requests to view activity fees
    Then the outcome should be <expected-outcome>
    Examples:
      | network-status | expected-outcome |
      | operational | see all available activity fees online |
      | down | error message indicating that no activity fees can be viewed |

