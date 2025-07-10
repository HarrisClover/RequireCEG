Feature: Filter Transactions by Date and Type

  As a user
  I want to filter my transactions by date and type
  So that I can easily find specific transactions

  Background:
    Given the user is logged into the system
    And the user has existing transactions

  Scenario: Scenario 1: Filter by date only
    Given the user selects a date range of '2023-01-01' to '2023-01-31'
    When the user applies the date filter
    Then all transactions within that date range should be displayed

  Scenario: Scenario 2: Filter by type only
    Given the user selects to view only sent transactions
    When the user applies the type filter
    Then only the sent transactions should be displayed

  Scenario: Scenario 3: Filter by both date and type
    Given the user selects a date range of '2023-02-01' to '2023-02-28'
    And the user selects to view only withdrawn transactions
    When the user applies both filters
    Then only the withdrawn transactions within that date range should be displayed
    And the filters result in matching transactions

  Scenario: Scenario 4: No matching transactions
    Given the user selects a date range of '2023-03-01' to '2023-03-31'
    And the user selects to view only sent transactions
    When the user applies both filters
    Then a message indicating that no transactions were found should be displayed
    And the filters result in no matching transactions

  Scenario: Scenario 5: Adult user allowed to send any amount
    Given the user is an adult
    When the user attempts to send 50 euros
    Then the user should be allowed to send 50 euros

  Scenario: Scenario 6: Non-adult user restricted to 20 euros
    Given the user is not an adult
    When the user attempts to send 30 euros
    Then the user should receive a message restricting the amount to a maximum of 20 euros

  Scenario: Scenario 7: Sending exceeds limit
    Given the user is not an adult
    When the user attempts to send money exceeding the 20 euros limit
    Then display an appropriate message for exceeding the 20 euros limit

  Scenario Outline: Scenario Outline: Filter transactions by date and type with various inputs
    Given the user selects a date range of '<start-date>' to '<end-date>'
    And the user selects to view '<transaction-type>' transactions
    When the user applies both filters
    Then transactions that fall within the specified date range and match the type should be displayed
    Examples:
      | start-date | end-date | transaction-type |
      | 2023-01-01 | 2023-01-10 | sent |
      | 2023-02-01 | 2023-02-15 | withdrawn |
      | 2023-03-01 | 2023-03-31 | sent |
      | 2023-04-01 | 2023-04-30 | withdrawn |

