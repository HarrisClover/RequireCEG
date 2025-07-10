Feature: Simulate Service Downtime

  As a system administrator
  I want to ensure users are informed about the status of booking services
  So that customers understand the availability of services and can retry their bookings

  Background:
    Given the booking system is operational
    And the car and hotel booking services are both healthy

  Scenario: Scenario 1: Car booking service is down
    Given the car booking service is unavailable
    When a customer tries to book a car
    Then the system should display 'Error: The car booking service is currently unavailable. Please try again later.'
    And the system logs a ServiceDownEvent for the car booking service

  Scenario: Scenario 2: Hotel booking service is down
    Given the hotel booking service is unavailable
    When a customer tries to book a hotel
    Then the system should display 'Warning: Hotel booking cannot be processed at this time.'
    And the system logs a ServiceDownEvent for the hotel booking service

  Scenario: Scenario 3: Both services are down
    Given both the car and hotel booking services are unavailable
    When a customer tries to book either service
    Then the system should display 'Error: All booking services are temporarily unavailable. Please try again later.'
    And the system logs a ServiceDownEvent for both services

  Scenario: Scenario 4: Booking processing timeout
    Given the booking service is experiencing a timeout
    When a customer attempts to finalize a booking
    Then the system should log a TimeoutEvent
    And the system should display 'Booking timeout occurred. Please retry your booking after a waiting period of X minutes.'

  Scenario: Scenario 5: Transaction Aborted
    Given a booking attempt fails due to a service being down
    When the system processes the cancellation
    Then the system should log a TxAbortedEvent
    And the system should log a TxCompensateAckSucceedEvent

  Scenario: Scenario 6: Booking system operational but a condition not met
    Given the booking system is operational
    When the customer attempts to book but the car booking service is down
    Then the system should not display any warning for the hotel booking service
    And the system logs a ServiceDownEvent for the car booking service

  Scenario: Scenario 7: Booking service unavailable and timeout
    Given the booking system is experiencing a timeout due to service unavailability
    When a customer attempts to finalize a booking
    Then the system should log a TimeoutEvent
    And the system should display 'Booking timeout occurred. Please retry your booking after a waiting period of X minutes.'
