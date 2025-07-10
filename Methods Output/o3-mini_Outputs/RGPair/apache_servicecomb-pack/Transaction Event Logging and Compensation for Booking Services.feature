Feature: Transaction Event Logging and Compensation for Booking Services
As the Alpha system, I want to accurately log transaction events for Car, Hotel, and Booking Services and execute compensating actions upon failures so that all transactions and adjustments are properly recorded and consistent.

Scenario Outline: Successful Booking Transaction
Given a user "<username>" initiates a booking transaction for "<service>"
And the system receives the booking request for the specified service
When the booking process starts
| Event | | SagaStartedEvent | | TxStartedEvent | When the booking process completes successfully
| Event | | TxEndedEvent | | SagaEndedEvent | Then the booking order for "<service>" is updated with:

The number of units booked

A confirmation status indicating success

Examples:
| username | service |
| Sean | Car |
| Sean | Hotel |
| Sean | Booking |

Scenario Outline: Transaction Failure and Compensation
Given a user "<username>" initiates a booking transaction for "<service>"
And an error condition occurs (e.g., "service down", "timeout", or "execution failure") during the booking process
When the system begins processing the booking
| Event | | SagaStartedEvent | | TxStartedEvent | When the error is detected
Then the system logs the corresponding abort events
| Event | | TxAbortedEvent | | TxCompensateAckSucceedEvent | And the booking order for "<service>" is updated to reflect cancellations and any compensating adjustments

Examples:
| username | service |
| Sean | Car |
| Sean | Hotel |
| Sean | Booking |