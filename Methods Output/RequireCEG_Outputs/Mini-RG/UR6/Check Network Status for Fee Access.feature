Feature: Check Network Status for Fee Access

  As a user
  I want to check activity fees online
  So that I can view my options based on the availability of fees

  Background:
    Given that the user is logged into the system
    And the user has a valid account

  Scenario: Scenario 1: Network is Up and Activity Fees Are Available
    Given the network connection is up
    And activity fees are available
    When the user attempts to view activity fees
    Then the user should see all available activity fees
    And the user can choose to create a bill statement

  Scenario: Scenario 2: Network is Up and No Activity Fees Available
    Given the network connection is up
    And there are no activity fees available
    When the user attempts to view activity fees
    Then the user should see a message indicating that there are no fees available for viewing

  Scenario: Scenario 3: Network is Down
    Given the network connection is down
    When the user attempts to view activity fees
    Then the user should see a message indicating that they cannot access any activity fees online

  Scenario: Scenario 4: Network is Up and Activity Fees are Available, then no Fees Available
    Given the network connection is up
    And activity fees are available
    When the user tries to view fees but updates show no fees available
    Then the user should see a message indicating that there are no fees available for viewing
    And the user cannot create a bill statement

  Scenario Outline: Scenario Outline: Network Status and Fee Availability
    Given the network status is <network-status>
    And the activity fees are <fee-availability>
    When the user attempts to access activity fees
    Then the outcome should be <outcome>
    Examples:
      | network-status | fee-availability | outcome |
      | up | available | user sees all available fees |
      | up | not available | user sees a message about no fees |
      | down | any | user sees a message about network access |

