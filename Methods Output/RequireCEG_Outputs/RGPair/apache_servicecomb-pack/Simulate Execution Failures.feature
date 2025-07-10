Feature: Simulate Execution Failures

  As a system administrator
  I want to log events of transaction lifecycle during booking processes
  So that I can monitor and manage issues effectively while ensuring transaction integrity

  Background:
    Given the booking service is available and ready to process transactions
    And there are multiple car and room bookings pending

  Scenario: Scenario 1: Successful booking transaction
    Given the booking service is online
    When a customer initiates a booking for cars and rooms
    Then SagaStartedEvent is logged
    And TxStartedEvent is logged

  Scenario: Scenario 2: Booking service down after initiating transaction
    Given the booking service is online
    When a customer initiates a booking and the service goes down immediately after
    Then SagaStartedEvent is logged
    And TxStartedEvent is logged
    And TxAbortedEvent is logged
    And SagaEndedEvent is logged

  Scenario: Scenario 3: Transaction timeout
    Given the booking service is online
    When a customer initiates a booking and a timeout occurs before completion
    Then SagaStartedEvent is logged
    And TxStartedEvent is logged
    And timeout event is logged
    And TxAbortedEvent is logged
    And SagaEndedEvent is logged

  Scenario: Scenario 4: Execution failure during transaction
    Given the booking service is online
    When a customer initiates a booking and an execution failure occurs
    Then SagaStartedEvent is logged
    And TxStartedEvent is logged
    And TxAbortedEvent is logged
    And TxCompensateAckSucceedEvent is logged
    And SagaEndedEvent is logged

  Scenario: Scenario 5: Service down before transaction initiation
    Given the booking service is down
    When a customer attempts to initiate a booking
    Then No events are logged

  Scenario Outline: Scenario Outline: Event Logging During Various States
    Given the booking service is <service-status>
    And the system has <transaction-status> transaction initiated
    When the customer takes an action leading to <event-type>
    Then <log-outcome> is logged
    Examples:
      | service-status | transaction-status | event-type | log-outcome |
      | online | initiated | success | SagaStartedEvent, TxStartedEvent |
      | down | pending | service unavailable | SagaStartedEvent, TxStartedEvent, TxAbortedEvent, SagaEndedEvent |
      | online | initiated | timeout | SagaStartedEvent, TxStartedEvent, timeout event, TxAbortedEvent, SagaEndedEvent |
      | online | initiated | execution failure | SagaStartedEvent, TxStartedEvent, TxAbortedEvent, TxCompensateAckSucceedEvent, SagaEndedEvent |

