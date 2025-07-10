Feature: Log SagaEndedEvent

  As a system administrator
  I want to ensure that transaction processes are properly tracked and logged
  So that I can maintain data integrity and have accurate records of transaction outcomes

  Background:
    Given a user initiates a transaction
    And the system is set up to log transaction events

  Scenario: Successful transaction completion
    Given the user Sean initiates a transaction
    And all services for booking cars and rooms are operational
    When the transaction processes complete successfully
    Then the system logs a SagaStartedEvent
    And the system logs a SagaEndedEvent

  Scenario: Transaction failure due to service timeout
    Given the user Sean initiates a transaction
    When a service related to the transaction encounters a timeout
    Then the system logs a SagaStartedEvent
    And the system logs a TxAbortedEvent

  Scenario: Transaction with compensation required
    Given the user Sean initiates a transaction
    When an error occurs during processing requiring compensating actions
    Then the system logs a SagaStartedEvent
    And the system logs a TxCompensateAckSucceedEvent

  Scenario: Transaction completion with all processes operational
    Given the user Sean initiates a transaction
    And all processes related to booking cars and rooms complete without interruptions
    When the transaction is successful
    Then the system logs a SagaStartedEvent
    And the system logs a SagaEndedEvent

  Scenario Outline: Scenario Outline: Transaction event logging
    Given the user <user> initiates a transaction
    And the service <service> is <status>
    When the transaction processes are <process-status>
    Then the system logs a <event-logged>
    And the system logs a <final-status>
    Examples:
      | user | service | status | process-status | event-logged | final-status |
      | Sean | booking | operational | successful | SagaStartedEvent | SagaEndedEvent |
      | Sean | booking | down | timed out | SagaStartedEvent | TxAbortedEvent |
      | Sean | payment | operational | error | SagaStartedEvent | TxCompensateAckSucceedEvent |

