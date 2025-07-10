Feature: Log TxEndedEvent

  As a store manager
  I want to ensure that booking transactions for cars and hotel rooms are successfully logged
  So that I can maintain a consistent and reliable system for tracking bookings

  Background:
    Given the user Sean is logged into the system
    And he initiates a booking for cars and hotel rooms

  Scenario: Scenario 1: Successful Booking Confirmation
    Given all events leading up to the transaction are executed successfully
    And the user receives a confirmation of the booking
    When the booking process completes
    Then a TxEndedEvent should be logged
    And the event should include the total number of units booked and the confirmation status

  Scenario: Scenario 2: Booking with Execution Failure
    Given the user Sean attempts to book but encounters an error
    When the booking process fails at any stage
    Then a TxAbortedEvent should be logged due to failure or timeout

  Scenario: Scenario 3: All Conditions Met for TxEndedEvent Logging
    Given the booking for cars and hotel rooms is confirmed
    And the saga has started successfully
    And the transaction has started successfully
    And the TxCompensateAckSucceed event is acknowledged
    And a timeout does not occur during the transaction process
    And there are no execution failures during the transaction process
    When the booking process is completed
    Then a TxEndedEvent should be logged with details of units booked and confirmation status

  Scenario: Scenario 4: Booking with a Timeout
    Given the user Sean is in the process of booking and the system experiences a timeout
    And the system has 10 seconds of inactivity
    When the timeout is reached
    Then a TxAbortedEvent should be logged with appropriate compensatory actions
