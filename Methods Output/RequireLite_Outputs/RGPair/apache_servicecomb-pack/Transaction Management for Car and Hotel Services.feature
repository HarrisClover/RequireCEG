Feature: Transaction Management for Car and Hotel Services

  As a store owner
  I want to accurately record transaction events for various booking services
  So that I can ensure smooth management and compensation in case of failures

  Background:
    Given the system is capable of handling transactions
    And the user has logged into the system

  Scenario: Successful booking of car and hotel
    Given the user initiates a booking for a car and a hotel room
    When the transaction process starts
    Then a SagaStartedEvent is logged
    And TxStartedEvent is logged for each service

  Scenario: Completion of successful booking
    Given the booking process has finished successfully
    When the system finalizes the transaction
    Then TxEndedEvent is logged for each booking
    And SagaEndedEvent is recorded

  Scenario: Transaction timeouts
    Given the user initiates a booking
    When a timeout occurs during the process
    Then TxAbortedEvent is logged
    And a compensating transaction is initiated with TxCompensateAckSucceedEvent

  Scenario Outline: Simulating error conditions
    Given the system is under test for error scenarios: <error-type>
    When the user attempts to book a car or hotel
    Then the system should log the appropriate abort event
    And the system should perform compensating actions as described
    Examples:
      | error-type | expected-outcome |
      | service down | TxAbortedEvent logged; compensating transaction initiated |
      | timeout | TxAbortedEvent logged; compensating actions initiated; tracking logs updated |
      | execution failure | TxAbortedEvent logged; compensation resolved and tracked |

