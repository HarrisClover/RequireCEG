Feature: Room Booking and Reservation System
  As a registered user
  I want to view available rooms and make reservations
  So that I can book a room for a stay with all charges and taxes calculated

  Scenario: View available rooms
    Given the system has a list of available rooms with dates, prices, and capacity
    When a user navigates to the room booking page
    Then the list of available rooms should be displayed with their corresponding details

  Scenario Outline: Reserve a room and verify total charge calculation
    Given a registered user is logged in
    And available room "<RoomName>" is listed with a base price of "<BasePrice>" and capacity "<Capacity>"
    When the user reserves the room for "<NumberOfNights>" nights
    And the system applies a tax rate of "<TaxRate>"
    Then the reservation confirmation should display the total charge as "<TotalCharge>"
    And the room should no longer be available in the list after a successful reservation

    Examples:
      | RoomName  | BasePrice | Capacity | NumberOfNights | TaxRate | TotalCharge |
      | "Suite A" | $150      | 2        | 3              | 0.10    | $495        |
      | "Room B"  | $100      | 1        | 2              | 0.08    | $216        |

  Scenario: Update available rooms list after reservation
    Given a room has been reserved by an authenticated user
    When the system refreshes the list of available rooms
    Then the reserved room should no longer appear in the available list
