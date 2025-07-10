Feature: Log TxAbortedEvent for Insufficient Units

  As a system administrator
  I want to log transaction failures due to insufficient inventory
  So that I can maintain an audit trail for troubleshooting and inventory management

  Background:
    Given a customer attempts to book an item
    And the item has insufficient units available

  Scenario: Scenario 1: Insufficient units for Item A
    Given the request is for 5 units of Item A
    And only 3 units are available
    When the system processes the booking request
    Then the transaction is aborted
    And a TxAbortedEvent is logged with details of the item shortage

  Scenario: Scenario 2: Insufficient units for Item B
    Given the request is for 2 units of Item B
    And only 1 unit is available
    When the system processes the booking request
    Then the transaction is aborted
    And a TxAbortedEvent is logged with details of the item shortage

  Scenario: Scenario 3: Confirm transaction logging due to insufficient units
    Given the request is for 4 units of Item C
    And only 2 units are available
    When the system processes the request
    Then the transaction is aborted
    And a TxAbortedEvent is logged with item: Item C, requested: 4, available: 2

  Scenario: Scenario 4: Log transaction details when the request exceeds available units
    Given the request is for 3 units of Item D
    And none are available
    When the system processes the booking request
    Then the transaction is aborted
    And a TxAbortedEvent is logged with item: Item D, requested: 3, available: 0

  Scenario Outline: Scenario Outline: Log Details for Insufficient Items
    Given the request is for <requested-units> of <item>
    And <available-units> units are available
    When the system processes the booking request
    Then the transaction is aborted
    And a TxAbortedEvent is logged with item: <item>, requested: <requested-units>, available: <available-units>
    Examples:
      | requested-units | item | available-units |
      | 5 | Item C | 2 |
      | 3 | Item D | 0 |
      | 1 | Item E | 0 |

