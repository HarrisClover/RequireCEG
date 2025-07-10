Feature: Process Successful Transactions

  As a store owner
  I want to manage booking transactions for cars and rooms
  So that I can ensure seamless booking experiences and handle potential errors effectively

  Background:
    Given the system is available and operational
    And a customer named Sean is logged into the system

  Scenario: Scenario 1: Successful booking of cars and rooms
    Given Sean initiates a booking transaction for cars and rooms
    When the booking proceeds without any errors
    Then a SagaStartedEvent is logged
    And a TxStartedEvent is logged
    And a TxEndedEvent is logged

  Scenario: Scenario 2: Completing car and room bookings successfully
    Given a booking transaction has been started
    When both cars and rooms are booked successfully
    Then a TxEndedEvent is logged
    And a SagaEndedEvent is logged

  Scenario: Scenario 3: Car and room booking error handling
    Given Sean initiates a booking transaction for cars and rooms
    When an error occurs during the booking process
    Then a TxAbortedEvent is logged
    And compensating actions are initiated
    And the booking process is aborted

  Scenario: Scenario 4: Logging events based on successful transactions with confirmed bookings for both cars and rooms including confirmation status update upon completion of transaction process, reflecting accurate confirmation status in both services.
    Given a booking transaction for cars and rooms has been successfully initiated
    When both cars and rooms are confirmed successfully
    Then a SagaStartedEvent is logged
    And a TxStartedEvent is logged
    And the confirmation status is updated correctly in both Car and Hotel services.

  Scenario Outline: Scenario Outline: Timeout during booking process
    Given a booking transaction has started
    And there is a timeout issue
    When the booking process is aborted due to the timeout
    Then a TxAbortedEvent is logged
    And TxCompensateAckSucceedEvent is logged
    Examples:
      | scenario | timeout type | compensation action |
      | Booking for two rooms and one car | network timeout | reverting room and car status |
      | Booking for one room and two cars | system downtime | cancelling the booking |

