Feature: Review Active Orders

  As a client
  I want to review my active orders
  So that I can stay informed about my trading activities

  Background:
    Given the client has an account in the system
    And the system has access to the client's order data

  Scenario: Scenario 1: Client with active orders
    Given the client has active bid and ask orders
    When the client requests to review their active orders
    Then the system displays the details of the active orders
    And includes the order type, price, size, and status

  Scenario: Scenario 2: Client with no active orders
    Given the client has no active orders in their account
    When the client requests to review their active orders
    Then the system informs the client that there are currently no active orders

  Scenario: Scenario 3: Client requests canceled orders
    Given the client has canceled orders
    When the client requests a summary of canceled orders
    Then the system provides the details of the canceled orders

  Scenario: Scenario 4: Client requests canceled orders with none existing
    Given the client has no canceled orders
    When the client requests a summary of canceled orders
    Then the system informs the client that there are currently no canceled orders

  Scenario: Scenario 5: Client with Good Till Cancelled orders
    Given the active orders include Good Till Cancelled orders
    When the client requests to review their active orders
    Then the system automatically updates the display to reflect the most recent active orders and available balances

  Scenario: Scenario 6: Client with Immediate Or Cancel orders
    Given the active orders include Immediate Or Cancel orders
    When the client requests to review their active orders
    Then the system automatically updates the display to reflect the most recent active orders and available balances

  Scenario Outline: Scenario Outline: Error while fetching orders
    Given the system encounters an error while fetching active orders
    When the client requests to review their active orders
    Then the system informs the client of the error
    And suggests retrying the request
    Examples:
      | error type | suggestion |
      | network issue | Please check your internet connection and try again |
      | server error | The system is currently unavailable. Please try again later |

