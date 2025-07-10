Feature: Log SagaStartedEvent

  As a system administrator
  I want to log the initiation of a transaction process
  So that I can track and manage bookings efficiently

  Background:
    Given a user logs into the system
    And the system is ready to process transactions

  Scenario: Scenario 1: Log a single vehicle booking
    Given the user Sean initiates a vehicle booking
    When the system triggers the SagaStartedEvent
    Then the event must include the user's information and transaction ID
    And the event should indicate the type of booking as a car

  Scenario: Scenario 2: Log a single hotel booking
    Given the user Sean initiates a hotel accommodation booking
    When the system triggers the SagaStartedEvent
    Then the event must include the user's information and transaction ID
    And the event should indicate the type of booking as a hotel

  Scenario: Scenario 3: Log combined vehicle and hotel booking
    Given the user Sean initiates a transaction to book both a vehicle and hotel
    When the system triggers the SagaStartedEvent
    Then the event must encapsulate both services with a unique transaction ID

  Scenario: Scenario 4: Handle system failure during transaction
    Given the system encounters a failure or timeout during a booking
    When the failure occurs
    Then the system must log abort events for individual bookings in progress due to the failure

  Scenario: Scenario 5: Log transaction ended event
    Given the individual sub-transaction is complete
    When the system logs TxEndedEvent for the sub-transaction
    Then the log should indicate the completion status

  Scenario Outline: Scenario Outline: Capture sub-transaction events
    Given the user <user> initiates a transaction
    And the system processes <number> services
    When the system logs a TxStartedEvent for the sub-transaction
    Then the log should include the sub-transaction details for <service>
    Examples:
      | user | number | service |
      | Sean | 1 | car booking |
      | Sean | 1 | hotel booking |
      | Sean | 2 | car and hotel booking |

