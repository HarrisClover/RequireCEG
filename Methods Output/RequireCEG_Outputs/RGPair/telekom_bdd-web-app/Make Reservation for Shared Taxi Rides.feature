Feature: Make Reservation for Shared Taxi Rides

  As a user
  I want to make a reservation for a shared taxi ride
  So that I can travel conveniently with other passengers and manage costs effectively

  Background:
    Given the user is logged into the system
    And there are shared taxi offers available

  Scenario: Scenario 1: User meets minimum passenger count
    Given a user selects 3 passengers for a ride
    When the user attempts to book a ride
    Then the system should allow the reservation
    And retrieve and display shared taxi offers to the user.

  Scenario: Scenario 2: User does not meet minimum passenger count
    Given a user selects 1 passenger for a ride
    When the user attempts to book a ride
    Then the system should present a message informing the user that they need to meet the minimum passenger count to proceed with a reservation.

  Scenario: Scenario 3: Requested time outside availability
    Given the user selects a reservation time outside the available rides
    When the user attempts to book a ride
    Then the system should notify that no rides can be booked during that time.

  Scenario: Scenario 4: JavaScript disabled in browser
    Given the user has JavaScript disabled
    When the user visits the taxi reservation page
    Then the system should direct the user to contact support via a provided link.

  Scenario: Scenario 5: Ticket price changes
    Given a user selects a ride with dynamic pricing
    When the number of passengers increases
    Then the system should update the ticket price in real-time
    And notify the user of the ticket price adjustment.

  Scenario: Scenario 6: Successful reservation
    Given the user confirms the ride details
    When the reservation process completes
    Then the system should display a confirmation message containing all relevant details of the booked ride.

  Scenario: Scenario 7: JavaScript disabled attempts to book a ride without prior support process initiated before reservation page visit
    Given the user has JavaScript disabled and attempts to make a reservation
    When the user tries to book a ride
    Then the system should present an alternative channel for ride reservation.
