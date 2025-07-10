Feature: Room Booking Feature

  As a customer
  I want to access the room booking feature
  So that I can book a room for my stay

  Background:
    Given the user is on the room booking page
    And the user has an account

  Scenario: User is authenticated and accesses room booking
    Given the user is logged into the system
    When the user attempts to access the room booking feature
    Then the system should display a list of available rooms with their respective dates, prices, and capacities

  Scenario: User is not authenticated
    Given the user is not logged into the system
    When the user attempts to access the room booking feature
    Then the system should redirect the user to the login screen
    And the system should display the message 'Please log in to access room booking.'

  Scenario: Room is available for booking
    Given the user is logged in and has viewed available rooms
    When the user selects a room for a specific date
    Then the system should check the availability of that room on the requested date
    And the system should display the message 'Room is available. Total price: [Total Price].'

  Scenario: Room booking confirmation
    Given the user has confirmed the booking for an available room
    When the user finalizes the booking
    Then the system should reserve the room
    And the system should send a confirmation email with the message 'Your booking has been confirmed for [Room Name] on [Date].'

  Scenario: Room is not available for booking
    Given the user selects a room for a specific date
    When the user tries to book a room that is not available
    Then the system should inform the user
    And the system should display the message 'The selected room is not available for the chosen date. Please select another date or room.'

  Scenario: User tries to book without authentication
    Given the user is not logged in
    When the user attempts to book a room
    Then the system should redirect the user to the login screen
    And the system should display the message 'Please log in to access room booking.'

  Scenario: User selects an unavailable room
    Given the user is logged in and views available rooms
    When the user selects a room that is not available for the requested date
    Then the system should inform the user
    And the system should display the message 'The selected room is not available for the chosen date. Please select another date or room.'
