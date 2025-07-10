Feature: Log TxCompensateAckSucceedEvent

  As a store owner
  I want to update booking orders in both Car and Hotel Services with cancellation status
  So that users can receive updated status for their bookings after compensation

  Background:
    Given the TxCompensateAckSucceedEvent is logged
    And the system is ready to process the cancellation status updates

  Scenario: Scenario 1: Update Car and Hotel Bookings
    Given a user has active bookings in Car and Hotel Services
    When the TxCompensateAckSucceedEvent is processed
    Then the Car Service booking status should reflect the cancellation
    And the Hotel Service booking status should reflect the cancellation

  Scenario: Scenario 2: No Active Bookings
    Given the user has no active bookings in Car and Hotel Services
    When the TxCompensateAckSucceedEvent is processed
    Then the system should not update any booking statuses

  Scenario: Scenario 3: Active Cancelled Bookings
    Given the user has bookings where the current cancellation status is different from the updated status
    When the TxCompensateAckSucceedEvent is processed
    Then the booking orders in both Car and Hotel Services should be updated with the appropriate cancellation status

  Scenario Outline: Scenario Outline: Verify Booking Updates
    Given a user has <number> active bookings for <service>
    And the TxCompensateAckSucceedEvent was logged
    When the system processes the compensation event
    Then the total bookings for <service> should be updated to <status>
    Examples:
      | number | service | status |
      | 2 | Car | Cancelled |
      | 3 | Hotel | Cancelled |
      | 1 | Car | Cancelled |

