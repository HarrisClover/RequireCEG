Feature: Room Booking
  As a registered user
  I want to book available rooms
  So that I can secure accommodation.

  Background:
    Given the following rooms are available:
      | Room Name | Date       | Price | Capacity |
      | Suite A   | 2024-10-20 | $200  | 2        |
      | Double B  | 2024-10-20 | $150  | 2        |
      | Single C  | 2024-10-21 | $100  | 1        |
    And applicable tax rate is 10%
    And I am logged in as user "booker@example.com"

  Scenario: Viewing Available Rooms
    When I navigate to the room booking page
    Then I should see a list of available rooms including:
      | Room Name | Date       | Price | Capacity |
      | Suite A   | 2024-10-20 | $200  | 2        |
      | Double B  | 2024-10-20 | $150  | 2        |
      | Single C  | 2024-10-21 | $100  | 1        |

  Scenario: Registered User Successfully Reserves a Room
    Given I am on the room booking page
    When I select to reserve "Suite A" for "2024-10-20"
    And I confirm the reservation
    Then I should receive a reservation confirmation for "Suite A"
    And the confirmation should show the total charge of $220 # $200 + 10% tax
    And the room "Suite A" for "2024-10-20" should no longer be listed as available
    And the rooms "Double B" and "Single C" should still be listed as available