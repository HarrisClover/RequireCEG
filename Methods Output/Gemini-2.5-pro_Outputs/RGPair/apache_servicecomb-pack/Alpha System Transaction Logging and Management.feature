Feature: Alpha System Transaction Logging and Management
  As a System Administrator or Tester
  I want to verify Alpha correctly logs transaction events and handles failures
  So that I can ensure data consistency and proper compensation across Car, Hotel, and Booking Services.

  Background:
    Given the Alpha system is operational
    And the Car Service endpoint is available
    And the Hotel Service endpoint is available
    And the Booking Service endpoint is available

  Scenario: Successful Booking Transaction
    Given a user "Sean" is logged into the Alpha system
    And the Car Service is configured for successful booking
    And the Hotel Service is configured for successful booking
    When "Sean" initiates a transaction to book 1 car and 1 hotel room
    Then the following events should be logged in sequence:
      | EventName                 |
      | SagaStartedEvent          |
      | TxStartedEvent (Car)      |
      | TxEndedEvent (Car)        |
      | TxStartedEvent (Hotel)    |
      | TxEndedEvent (Hotel)      |
      | SagaEndedEvent            |
    And the Car Service order for "Sean" should show:
      | Field       | Value |
      | UnitsBooked | 1     |
      | Confirmed   | true  |
      | Cancelled   | false |
    And the Hotel Service order for "Sean" should show:
      | Field       | Value |
      | UnitsBooked | 1     |
      | Confirmed   | true  |
      | Cancelled   | false |

  Scenario: Booking Transaction Failure with Compensation (Hotel Service Fails)
    Given a user "Sean" is logged into the Alpha system
    And the Car Service is configured for successful booking
    And the Hotel Service is configured to simulate an execution failure during booking
    When "Sean" initiates a transaction to book 1 car and 1 hotel room
    Then the following key events should be logged (order may vary slightly for parallel compensation):
      | EventName                       | Notes                                    |
      | SagaStartedEvent                |                                          |
      | TxStartedEvent (Car)            |                                          |
      | TxEndedEvent (Car)              | Car booking initially succeeds           |
      | TxStartedEvent (Hotel)          |                                          |
      | TxAbortedEvent (Hotel)          | Hotel booking fails                      |
      | TxStartedEvent (Car Compensate) | Compensation for Car booking starts      |
      | TxCompensateAckSucceedEvent (Car) | Compensation for Car booking confirmed |
      | SagaEndedEvent                  | Saga completes (potentially in failed state) |
    And the Car Service order for "Sean" should reflect compensation:
      | Field       | Value |
      | UnitsBooked | 0     | # Or original value with Cancelled=true
      | Confirmed   | false |
      | Cancelled   | true  |
    And the Hotel Service order for "Sean" should reflect failure:
      | Field       | Value |
      | UnitsBooked | 0     |
      | Confirmed   | false |
      | Cancelled   | false | # Or true depending on failure point

  Scenario: Booking Transaction Timeout with Compensation (Hotel Service Times Out)
    Given a user "Sean" is logged into the Alpha system
    And the Car Service is configured for successful booking
    And the Hotel Service is configured to simulate a transaction timeout
    When "Sean" initiates a transaction to book 1 car and 1 hotel room
    Then the following key events should be logged (order may vary slightly for parallel compensation):
      | EventName                       | Notes                                     |
      | SagaStartedEvent                |                                           |
      | TxStartedEvent (Car)            |                                           |
      | TxEndedEvent (Car)              | Car booking initially succeeds            |
      | TxStartedEvent (Hotel)          |                                           |
      | TxAbortedEvent (Hotel)          | Hotel booking times out                   |
      | TxStartedEvent (Car Compensate) | Compensation for Car booking starts       |
      | TxCompensateAckSucceedEvent (Car) | Compensation for Car booking confirmed  |
      | SagaEndedEvent                  | Saga completes (potentially in timed-out state) |
    And the Car Service order for "Sean" should reflect compensation:
      | Field       | Value |
      | UnitsBooked | 0     | # Or original value with Cancelled=true
      | Confirmed   | false |
      | Cancelled   | true  |
    And the Hotel Service order for "Sean" should reflect failure/timeout:
      | Field       | Value |
      | UnitsBooked | 0     |
      | Confirmed   | false |
      | Cancelled   | false | # Or true depending on failure point

  Scenario Outline: Simulating Service Errors during Booking
    Given a user "Sean" is logged into the Alpha system
    And the <FailingService> is configured to simulate <ErrorType>
    And the other service is configured for success (if applicable before failure)
    When "Sean" initiates a transaction to book 1 car and 1 hotel room
    Then the transaction should eventually be aborted
    And a <AbortEvent> should be logged for the <FailingService>
    And compensating events (like TxStartedEvent Compensate, TxCompensateAckSucceedEvent) should be logged for any preceding successful service calls
    And the final Car Service order for "Sean" should show booking as not confirmed and potentially cancelled
    And the final Hotel Service order for "Sean" should show booking as not confirmed and potentially cancelled

    Examples:
      | FailingService | ErrorType         | AbortEvent             |
      | Car Service    | Service Down      | TxAbortedEvent (Car)   |
      | Hotel Service  | Service Down      | TxAbortedEvent (Hotel) |
      | Car Service    | Execution Failure | TxAbortedEvent (Car)   |
      | Hotel Service  | Execution Failure | TxAbortedEvent (Hotel) |
      | Car Service    | Timeout           | TxAbortedEvent (Car)   |
      | Hotel Service  | Timeout           | TxAbortedEvent (Hotel) |