Feature: Send Confirmation of Room Reservation

  As a hotel manager
  I want to confirm room reservations efficiently
  So that customers receive timely information about their bookings

  Background:
    Given a customer wants to reserve a room
    And the room selection is made

  Scenario: Scenario 1: Successful Room Reservation
    Given the selected room is available
    When the customer submits the reservation request
    Then the system checks the availability status of the selected room
    And the total charges are calculated

  Scenario: Scenario 2: Room Not Available
    Given the selected room is not available
    When the customer attempts to reserve the room
    Then an error message is displayed indicating that the selected room is unavailable

  Scenario: Scenario 3: Successful Reservation Confirmation
    Given the selected room is available
    And the total charges are calculated based on the room price and applicable taxes
    When the customer submits the reservation request
    Then the system confirms the reservation
    And a confirmation email is sent to the user's registered email address

  Scenario: Scenario 4: Update Available Rooms List
    Given the selected room is available
    When the customer submits the reservation request
    Then the system updates the available rooms list to prevent double bookings
