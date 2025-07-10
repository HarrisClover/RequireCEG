Feature: Taxi Reservation

  As a logged-in user,
  I want to make reservations for shared taxi rides,
  So that I can book my transport.

  Background: User is Logged In
    Given a registered user "booker@example.com" with password "password123" exists
    And the user is logged in as "booker@example.com"

  Scenario: Successfully Reserve a Taxi with Real-time Price Update
    Given there are available taxi offers for "Downtown Route" at "10:00 AM"
    And the base price for 1 passenger is "$20"
    And the price per passenger for 3 passengers is "$15"
    When the user navigates to the reservation page
    And the user selects "Downtown Route"
    And the user selects the time "10:00 AM"
    And the user selects "3" passengers
    Then the system should display a total price of "$45"
    When the user clicks the "Confirm Reservation" button
    Then the user should see a reservation confirmation message
    And the reservation for "Downtown Route" at "10:00 AM" for 3 passengers should be recorded

  Scenario: Attempt to Reserve When No Offers are Available
    Given there are no available taxi offers for "Airport Route" at "02:00 PM"
    When the user navigates to the reservation page
    And the user selects "Airport Route"
    And the user selects the time "02:00 PM"
    Then the system should display a message "No available rides for the selected time/route"
    And the reservation confirmation button should be disabled or hidden

  Scenario: Attempt to Reserve with JavaScript Disabled
    Given the user has disabled JavaScript in their browser
    When the user navigates to the reservation page
    And the user attempts to select a route and time
    Then the user should see a message indicating JavaScript is recommended or required for full functionality
    # Depending on implementation, further steps might describe a non-JS fallback or simply state reservation is not possible.
    # Example if reservation is blocked:
    And the user should not be able to proceed with the reservation via the standard interface