Feature: Update Available Room List After Reservation

  As a registered user
  I want to reserve a room and have the system update availability
  So that I can ensure my booking is confirmed and that other users know the current availability

  Background:
    Given a list of available rooms
    And the price and availability status of each room for the specified date

  Scenario: Scenario 1: Successful Room Reservation
    Given the user is a registered user
    And the user selects a room for a specified date
    And the room is available for booking
    When the user submits the reservation request
    Then the total charges are calculated correctly
    And the system sends a reservation confirmation message to the user
    And the system verifies the availability of the selected room

  Scenario: Scenario 2: Room Not Available
    Given the user is a registered user
    And the user selects a room for a specified date
    When the user checks the availability of the room
    Then the system should indicate that the room is no longer available
    And the system accurately reflects that the room is no longer available for other users

  Scenario: Scenario 3: Total Charges Calculation
    Given the user is a registered user
    And the room is selected
    And the total charges can be calculated based on the room price, taxes, and duration of stay
    When the user proceeds to reserve the room
    Then the system calculates the total charges
    And the system marks the reserved room as unavailable for the selected date

  Scenario Outline: Scenario Outline: Room Reservation Process
    Given the user is a registered user
    And the selected room price is <room-price>
    When the user reserves the room for <duration> days
    Then the total charges are <total-charges>
    Examples:
      | room-price | duration | total-charges |
      | $150 | 3 | $450 |
      | $200 | 2 | $400 |
      | $100 | 5 | $500 |

