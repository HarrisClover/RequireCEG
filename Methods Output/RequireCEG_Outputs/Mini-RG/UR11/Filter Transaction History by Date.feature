Feature: Filter Transaction History by Date

  As a user with permissions to view transaction history
  I want to access my transaction history and filter it by specific dates
  So that I can review my past transactions within a selected time period

  Background:
    Given the user has permission to check transaction history
    And the user inputs a valid start date and end date

  Scenario: Scenario 1: User with permission can view and store the transaction history
    Given the user has permission to check and keep a record of transaction history
    And the user has transactions available for viewing
    When the user attempts to access their transaction history
    Then the system displays the full transaction history
    And the system confirms that the records have been saved

  Scenario: Scenario 2: User with permission can only view the transaction history
    Given the user has permission to check transaction history but not to keep a record
    When the user attempts to access their transaction history
    Then the system displays the transaction history
    And the system informs the user that they cannot save records

  Scenario: Scenario 3: User without permission is denied access to transaction history
    Given the user lacks permission to check transaction history
    When the user tries to access their transaction history
    Then the system denies access
    And the system displays a message about insufficient permissions

  Scenario: Scenario 4: User provides invalid dates for filtering
    Given the user has permission to check transaction history
    And the user inputs a start date of '2023-03-31' and an end date of '2023-01-01'
    When the user requests to view transactions within the specified date range
    Then the system displays a message indicating that the entered dates are not valid.

  Scenario: Scenario 5: User enters valid dates but start date is not earlier than end date
    Given the user has permission to check transaction history
    And the user inputs a start date of '2023-02-01' and an end date of '2023-02-01'
    When the user requests to view transactions within the specified date range
    Then the system displays a message indicating that the start date must be earlier than the end date.
