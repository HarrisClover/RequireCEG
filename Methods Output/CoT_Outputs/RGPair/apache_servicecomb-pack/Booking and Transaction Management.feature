Feature: Booking and Transaction Management
  As a system (Alpha),
  I want to accurately log and manage transaction events for car and hotel bookings,
  So that I can ensure the consistency of transactions and handle errors gracefully.

Scenario Outline: Successful Transaction for Booking Services
  Given that a user <user> initiates a booking transaction for <service> 
  And the system is up and running
  When the booking for <service> is processed successfully
  Then the system should log a SagaStartedEvent
  And the system should log a TxStartedEvent
  And the system should log a TxEndedEvent
  And the system should log a SagaEndedEvent
  And the booking should be updated with <number> units, confirmed status, and no cancellations

Examples:
  | user  | service | number |
  | Sean  | Car     | 1      |
  | Sean  | Hotel   | 2      |

Scenario Outline: Transaction Failure Due to Timeout or Service Down
  Given that a user <user> initiates a booking transaction for <service> 
  And the system encounters a timeout or service failure
  When the booking for <service> fails due to timeout or service failure
  Then the system should log a SagaStartedEvent
  And the system should log a TxStartedEvent
  And the system should log a TxAbortedEvent
  And the system should log a TxCompensateAckSucceedEvent
  And the booking should be updated to reflect the failure, with no units confirmed

Examples:
  | user  | service |
  | Sean  | Car     |
  | Sean  | Hotel   |

Scenario Outline: Successful Booking with Multiple Services
  Given that a user <user> initiates bookings for both Car and Hotel services
  And the system processes both services successfully
  When both bookings are completed
  Then the system should log a SagaStartedEvent
  And the system should log a TxStartedEvent for each service
  And the system should log a TxEndedEvent for each service
  And the system should log a SagaEndedEvent
  And the bookings should be updated with correct units and confirmed status for both services

Examples:
  | user  |
  | Sean  |
