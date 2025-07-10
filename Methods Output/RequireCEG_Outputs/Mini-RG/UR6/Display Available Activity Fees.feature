Feature: Display Available Activity Fees

  As a user
  I want to view available activity fees
  So that I can select relevant fees for creating bills or simply be informed of the available options

  Background:
    Given the user has internet access
    And activity fees are available

  Scenario: Scenario 1: Display All Available Activity Fees
    Given the user is logged into the system
    And activity fees are available
    When the user requests to view activity fees
    Then the system should display a list of all available activity fees
    And the user can select an activity fee

  Scenario: Scenario 2: Display Relevant Activity Fees for Bill Statement
    Given the user is online
    When the user intends to create a bill statement
    Then the system should display a subset of activity fees relevant for that purpose

  Scenario: Scenario 3: No Activity Fees Available for Online User
    Given the user is online
    And there are no activity fees available in the system database
    Then the system should communicate a message stating 'No activity fees are available.'

  Scenario: Scenario 4: Network Connectivity Issues for Online User
    Given the user is offline
    When the user attempts to access activity fees in the system
    Then the system should present a message indicating 'Network connectivity issues. Please try again later.'

  Scenario: Scenario 5: User Online Checking Activity Fees When Fees Are Unavailable, Expecting Feedback for Connectivity Issues or Fee Availability, Without Showing Fees to Achieve Clear Business Goals in User Interaction and Business Objectivity: Logic and Feedback must be Improved
    Given the user is online
    And there are no activity fees available in the system database
    And the user's network connectivity is down
    Then the system should communicate a message stating 'Network connectivity issues. Please try again later.'
    And the user should not see any activity fee options.
