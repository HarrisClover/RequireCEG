Feature: Log TxAbortedEvent

  As a system administrator
  I want to log details of a failed transaction
  So that I can monitor transaction issues and take corrective actions

  Background:
    Given a user attempts to book a transaction
    And the system may encounter exceptions or timeouts

  Scenario: Transaction Aborted due to Exception
    Given the transaction is initiated by user Sean
    When the booking process encounters an exception
    Then the system logs a TxAbortedEvent
    And the event captures transaction details including time, user ID, transaction ID, and the specific error

  Scenario: Transaction Aborted due to Timeout
    Given the transaction is initiated by user Sean
    When the booking process times out
    Then the system logs a TxAbortedEvent
    And the system triggers compensating actions to mitigate the effects of the aborted transaction

  Scenario: Transaction Aborted with Service Down
    Given the transaction is initiated by user Sean
    And the system encounters a service down condition during the booking process
    When the booking process results in an aborted transaction
    Then the system logs a TxAbortedEvent
    And the system logs the specific error encountered
    And the system triggers compensating actions to mitigate the effects of the aborted transaction

  Scenario: Compensate Actions and Confirmation Update
    Given the system has logged a TxAbortedEvent
    When the system executes the compensating actions
    Then the system logs a TxCompensateAckSucceedEvent
    And the system updates related service orders to reflect their cancellation status accurately
    And the number of units booked is set to zero in the related service orders
    And the confirmation status is appropriately updated to indicate failure

  Scenario Outline: Scenario Outline: Compensate Actions and Confirm
    Given the system has logged a TxAbortedEvent
    And the transaction includes a service that is down
    When the system executes the compensating actions
    Then the system logs a TxCompensateAckSucceedEvent
    Examples:
      | status | service | units | confirmation |
      | cancellation | serviceA | 0 | failed |
      | cancellation | serviceB | 0 | failed |
      | cancellation | serviceC | 0 | failed |

