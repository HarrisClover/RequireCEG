Feature: Reserve a Room with Total Charges Calculation

  As a registered user
  I want to reserve a room for my stay
  So that I can ensure accommodation and know the total charges for budgeting

  Background:
    Given the user is logged into the system
    And the user has selected a room for reservation

  Scenario: Scenario 1: Room availability check
    Given the user requests a room for the specified dates
    When the system checks the availability of the room
    Then if the room is available, the total charges should be calculated
    And the user should see a detailed breakdown of charges

  Scenario: Scenario 2: Successful reservation
    Given the room is available for the requested dates
    When the user confirms the reservation
    Then the system reserves the room
    And the user receives a confirmation email

  Scenario: Scenario 3: Room not available
    Given the room is not available for the requested dates
    When the user tries to reserve the room
    Then the system should notify the user that the room is unavailable
    And the user is prompted to select a different room or alternate dates

  Scenario: Scenario 4: User confirms reservation
    Given the user confirms the reservation
    When the room is available and the price per night is known along with applicable taxes
    Then the system should calculate the total charges by multiplying the room's price per night with the total number of nights and adding applicable taxes
    And the user should see a confirmation email sent

  Scenario Outline: Scenario Outline: Total Charges Calculation
    Given the room price per night is <price-per-night>
    And the user intends to stay for <number-of-nights> nights
    When the system calculates the total charges
    Then the total charges should be <total-charges>
    Examples:
      | price-per-night | number-of-nights | total-charges |
      | $150 | 2 | $330 |
      | $200 | 3 | $600 |
      | $100 | 5 | $530 |

