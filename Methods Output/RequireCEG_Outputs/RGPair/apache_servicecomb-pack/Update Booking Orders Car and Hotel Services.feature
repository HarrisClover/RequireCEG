Feature: Update Booking Orders (Car and Hotel Services)

  As a user
  I want to book both car and hotel services
  So that I can plan my travel efficiently

  Background:
    Given the user Sean is logged into the system
    And the user has selected car and hotel services for booking

  Scenario: Scenario 1: Successful Booking
    Given the user attempts to book 1 car and 1 hotel room
    When the user initiates the transaction
    Then a SagaStartedEvent is logged
    And a TxStartedEvent is logged
    And the booking service processes successfully
    And a TxEndedEvent is logged
    And a SagaEndedEvent is logged
    And the updated booking details are displayed to the user

  Scenario: Scenario 2: Car Service Unavailable
    Given the user attempts to book 1 car and 1 hotel room
    When the user initiates the transaction
    And the car booking service is down
    Then a SagaStartedEvent is logged
    And a TxStartedEvent is logged
    And a TxAbortedEvent is logged
    And log the relevant error events
    And the user is informed that the booking cannot proceed due to unavailability

  Scenario: Scenario 3: Booking with Insufficient Availability
    Given the user attempts to book 2 units of car service and 2 units of hotel service
    When the user initiates the transaction
    Then a SagaStartedEvent is logged
    And a TxStartedEvent is logged
    And the system checks availability
    And the system returns an error message stating 'booking cannot proceed due to insufficient availability'
    And a TxAbortedEvent is logged

  Scenario Outline: Scenario Outline: Insufficient Availability
    Given the user attempts to book <units> units of car service and <units> units of hotel service
    When the user initiates the transaction
    Then a SagaStartedEvent is logged
    And a TxStartedEvent is logged
    And the system checks availability
    And the system returns an error message stating 'booking cannot proceed due to insufficient availability'
    And a TxAbortedEvent is logged
    Examples:
      | units | service |
      | 2 | car |
      | 3 | hotel |
      | 5 | car |
      | 4 | hotel |

