Feature: Viewing Activity Fees

  As a user
  I want to view all available activity fees online
  So that I can easily create a bill statement

  Background:
    Given the system is functioning properly
    And there are available activity fees

  Scenario: View activity fees when creating a bill statement
    Given the user plans to create a bill statement
    When the user requests to view activity fees
    Then the user should be able to view all available activity fees online

  Scenario: View some activity fees when creating a bill statement with filtering
    Given the user plans to create a bill statement
    When the user applies specific filtering criteria
    Then the user should be able to view the filtered activity fees online
    And the user wants to filter activity fees by category and price range

  Scenario: View activity fees without creating a bill statement
    Given the user does not plan to create a bill statement
    When the user requests to view activity fees
    Then the user should be able to view all available activity fees online

  Scenario: Unable to view activity fees when network is down
    Given the network is down
    When the user attempts to view activity fees
    Then the user should not be able to view any activity fees online
    And the user should receive an appropriate error message indicating a network issue

  Scenario: Unable to view activity fees when there are none available
    Given there are no available activity fees online
    When the user attempts to view activity fees
    Then the user should not be able to view any activity fees online
    And the user should be informed that there are currently no fees available
