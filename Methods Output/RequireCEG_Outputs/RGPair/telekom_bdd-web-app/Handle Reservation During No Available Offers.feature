Feature: Handle Reservation During No Available Offers

  As a system user
  I want to make a reservation for a shared taxi ride
  So that I can ensure my travel plans are fulfilled

  Background:
    Given the user is logged in to the reservation system
    And the ride-sharing offers are being checked for availability

  Scenario: Scenario 1: No Available Offers
    Given there are no available offers for shared taxi rides
    When the user attempts to make a reservation
    Then the system should display a message stating that no reservations can be made at this time

  Scenario: Scenario 2: JavaScript Disabled
    Given the user has JavaScript disabled in their browser
    When the user tries to make a reservation
    Then the system should inform the user that JavaScript is required for this feature to function correctly

  Scenario: Scenario 3: Non-Peak Hours with Insufficient Passengers
    Given the current time is during non-peak hours
    And the passenger count is fewer than the minimum required
    When the user attempts to reserve a ride
    Then the system should inform the user that the reservation cannot be completed due to insufficient offers and encourage them to check again later

  Scenario: Scenario 4: Peak Hours with Insufficient Passengers
    Given the current time is during peak hours
    And the passenger count does not meet the minimum requirements
    When the user attempts to reserve a ride
    Then the system should display a message stating that the reservation cannot proceed due to the lack of offers for the specified time

  Scenario: Scenario 5: JavaScript Requirement
    Given JavaScript is not enabled in the user's browser
    When the user attempts to make a reservation
    Then the system must detect the absence of JavaScript and provide a message indicating that JavaScript is required
