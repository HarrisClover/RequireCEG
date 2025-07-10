Feature: Handle Fee Viewing in Network Down Situations

  As a user of the billing system
  I want to be informed about the availability of activity fees based on network status
  So that I can understand the accessibility of information and take appropriate actions

  Background:
    Given the user is logged into the system
    And the network status is being monitored

  Scenario: Scenario 1: Network is down and user wants to create a bill
    Given the user intends to create a bill statement
    And the network is found to be down
    When the user attempts to view the activity fees
    Then the system shall display the error message: 'Error: Activity fees are currently unavailable due to network issues.'

  Scenario: Scenario 2: Network is down and user does not want to create a bill
    Given the user does not intend to create a bill statement
    And the network is found to be down
    When the user attempts to view the activity fees
    Then the system shall present the message: 'Error: Fees cannot be accessed due to connectivity issues.'

  Scenario: Scenario 3: Network is up but no activity fees are available
    Given the network is confirmed to be up
    When the user views the activity fees
    Then the system shall provide the message, 'No activity fees are currently available.'

  Scenario: Scenario 4: Network is down and activity fees are available
    Given the network is found to be down
    And activity fees are available online
    When the user attempts to access the fees
    Then the system shall display the error message: 'Error: Activity fees are currently unavailable due to network issues.'

  Scenario: Scenario 5: Network is up, and there are activity fees available
    Given the network is confirmed to be up
    And activity fees are available online
    When the user views the activity fees
    Then the system shall allow the user to view all activity fees online.
