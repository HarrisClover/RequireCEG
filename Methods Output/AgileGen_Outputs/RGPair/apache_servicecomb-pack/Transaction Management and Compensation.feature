Feature: Transaction Management and Compensation

  As a system administrator,
  I want the Alpha system to accurately record and manage transaction events
  So that I can ensure consistent and correct transaction processing, including handling failures and compensating actions.

  Scenario Outline: Successful Booking Transaction for Car and Hotel Services
    Given the system is online and available
    And Sean initiates a transaction to book <car-units> car(s) and <hotel-units> room(s)
    When the system processes the booking request
    Then the system should log the following events:
      | Event                   | Status      |
      | SagaStartedEvent         | Started     |
      | TxStartedEvent           | Started     |
      | TxEndedEvent             | Completed   |
      | SagaEndedEvent           | Ended       |
    And the booking order for Car Services should show <car-units> unit(s) booked, confirmed
    And the booking order for Hotel Services should show <hotel-units> room(s) booked, confirmed
    Examples:
      | car-units | hotel-units |
      | 1         | 1           |
      | 2         | 2           |

  Scenario Outline: Failed Booking Transaction for Car and Hotel Services due to Service Timeout
    Given the system is online and available
    And Sean initiates a transaction to book <car-units> car(s) and <hotel-units> room(s)
    And the system encounters a timeout while processing the booking request
    When the system attempts to compensate for the failure
    Then the system should log the following events:
      | Event                   | Status      |
      | SagaStartedEvent         | Started     |
      | TxStartedEvent           | Started     |
      | TxAbortedEvent           | Aborted     |
      | TxCompensateAckSucceedEvent | Acknowledged |
      | SagaEndedEvent           | Ended       |
    And the booking order for Car Services should show no units booked
    And the booking order for Hotel Services should show no rooms booked
    Examples:
      | car-units | hotel-units |
      | 1         | 1           |
      | 2         | 2           |

  Scenario Outline: Failed Booking Transaction for Car and Hotel Services due to Service Down
    Given the system is online and available
    And Sean initiates a transaction to book <car-units> car(s) and <hotel-units> room(s)
    And the system encounters a service down error while processing the booking request
    When the system attempts to compensate for the failure
    Then the system should log the following events:
      | Event                   | Status      |
      | SagaStartedEvent         | Started     |
      | TxStartedEvent           | Started     |
      | TxAbortedEvent           | Aborted     |
      | TxCompensateAckSucceedEvent | Acknowledged |
      | SagaEndedEvent           | Ended       |
    And the booking order for Car Services should show no units booked
    And the booking order for Hotel Services should show no rooms booked
    Examples:
      | car-units | hotel-units |
      | 1         | 1           |
      | 2         | 2           |

  Scenario Outline: Booking Transaction for Car and Hotel Services with Partial Failure
    Given the system is online and available
    And Sean initiates a transaction to book <car-units> car(s) and <hotel-units> room(s)
    And the system encounters an error while booking <failed-service> service
    When the system compensates for the failure
    Then the system should log the following events:
      | Event                   | Status      |
      | SagaStartedEvent         | Started     |
      | TxStartedEvent           | Started     |
      | TxAbortedEvent           | Aborted     |
      | TxCompensateAckSucceedEvent | Acknowledged |
      | SagaEndedEvent           | Ended       |
    And the booking order for <failed-service> should show no units booked
    And the booking order for the other service should show successful booking
    Examples:
      | car-units | hotel-units | failed-service |
      | 1         | 1           | Car            |
      | 2         | 1           | Hotel          |

