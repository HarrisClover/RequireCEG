Feature: Validate Transaction Correction Mechanisms

  As a system administrator
  I want to ensure the system properly handles transaction failures and compensates accordingly
  So that the integrity of service orders and bookings is maintained

  Background:
    Given the system is fully operational
    And all transactions must be logged for auditing purposes

  Scenario: Transaction Failure with Service Down
    Given a service is currently down
    When a transaction is attempted
    Then a TxAbortedEvent should be logged
    And compensating actions should be initiated to adjust the service orders

  Scenario: Transaction Timeout
    Given a transaction exceeds the specified timeout limits
    When the transaction is aborted
    Then a TxAbortedEvent should be logged
    And a TxCompensateAckSucceedEvent should confirm that compensation was successful

  Scenario: Concurrent Bookings with One Failure
    Given Sean initiates concurrent bookings for a car and a hotel
    When one booking fails
    Then the status of the remaining booking should remain unchanged
    And a SagaEndedEvent should be logged

  Scenario: Updating Booking Orders After Compensating Actions
    Given compensating actions are required due to a failure
    When the system updates the booking orders for both Car and Hotel Services
    Then the number of units booked should be reflected correctly
    And the confirmation status should be set to 'cancelled'

  Scenario: Successful Compensating Actions
    Given compensating actions are initiated for the failed transaction
    When successful compensating actions are completed
    Then the booking order should reflect accurate adjustments
    And the system should ensure all relevant data is consistent and reliable

  Scenario Outline: Transaction Correction Based on Failure Type
    Given a transaction fails due to <failure-type>
    And the service involved is <service-name>
    When the system processes the failure
    Then appropriate events are logged for <event-logging>
    And <additional-outcome>
    Examples:
      | failure-type | service-name | event-logging | additional-outcome |
      | service down | payment | TxAbortedEvent | service orders are adjusted |
      | timeout | booking | TxAbortedEvent | transaction status is marked 'failed' |
      | concurrent failure | car booking | SagaEndedEvent | remaining bookings are intact |

