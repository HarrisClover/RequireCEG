Feature: Ensure Data Consistency Across Services

  As a store owner
  I want to manage booking transactions coherently
  So that I can ensure that all bookings are processed correctly or reverted appropriately

  Background:
    Given a store owner is attempting to book a car and a hotel room
    And the system is initialized with appropriate logging mechanisms

  Scenario: Scenario 1: Successful booking process
    Given Sean initiates a transaction for booking a car and hotel
    And the transaction initiation is successful
    When the booking process completes successfully without errors
    Then a SagaStartedEvent is logged
    And a TxStartedEvent is logged
    And a TxEndedEvent is logged
    And the booking statuses are updated appropriately

  Scenario: Scenario 2: Transaction failure with compensation
    Given Sean initiates a transaction for booking a car and hotel
    When an error occurs during the transaction process
    Then a TxAbortedEvent is logged
    And the compensatory action is triggered
    And the booking orders in Car and Hotel Services are updated accordingly

  Scenario: Scenario 3: Transaction exceeds timeout limit
    Given the timeout limit is exceeded
    And the transaction state indicates an error occurred
    When the system processes the booking
    Then a TxAbortedEvent is logged
    And the compensatory action is triggered

  Scenario Outline: Scenario Outline: Transaction completion scenarios
    Given the timeout limit is <timeout-limit>
    And the transaction state is <transaction-state>
    When the system processes the booking
    Then log <event-logged>
    And the booking statuses are updated appropriately
    Examples:
      | timeout-limit | transaction-state | event-logged |
      | 5 minutes | successful | TxEndedEvent |
      | 5 minutes | error occurred | TxAbortedEvent |
      | 3 minutes | successful | TxCompensateAckSucceedEvent |

