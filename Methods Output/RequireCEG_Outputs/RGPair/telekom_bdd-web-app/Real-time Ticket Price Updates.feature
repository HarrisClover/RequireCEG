Feature: Real-time Ticket Price Updates

  As a customer
  I want to receive updated ticket prices based on reservation times
  So that I can make informed decisions when booking my ticket

  Background:
    Given the user is on the reservation page
    And the system is online and capable of processing requests

  Scenario: Scenario 1: Peak Hour Pricing
    Given a reservation is made during peak hours
    When the user checks the ticket price
    Then the ticket price should reflect a 20% increase
    And the user is notified of the peak hour surcharge

  Scenario: Scenario 2: Off-Peak Pricing
    Given a reservation is made outside of peak hours
    When the user checks the ticket price
    Then the ticket price remains unchanged

  Scenario: Scenario 3: No Available Offers
    Given the requested reservation time has no available offers
    When the user attempts to make a reservation
    Then a message displays 'No reservations can be made at this time.'

  Scenario: Scenario 4: JavaScript Disabled
    Given the user has JavaScript disabled in their browser
    When the user accesses the reservation page
    Then a message appears notifying 'JavaScript is required for real-time updates.'

  Scenario: Scenario 5: Real-Time Update Failure
    Given the system fails to retrieve real-time ticket prices
    When the user refreshes the ticket price
    Then the last known ticket price is displayed until updates are successful

  Scenario: Scenario 6: Ticket Price Calculation During Peak Hours
    Given there are passengers for the reservation
    And the reservation time falls within peak hours
    When the user checks the ticket price
    Then the ticket price reflects a 20% increase due to peak hour pricing

  Scenario: Scenario 7: Ticket Price Calculation During Off-Peak Hours
    Given there are passengers for the reservation
    And the reservation time falls outside of peak hours
    When the user checks the ticket price
    Then the ticket price remains unchanged

  Scenario Outline: Scenario Outline: Ticket Price Calculation Based on Passengers
    Given there are <passengers> passengers for the reservation
    And the ticket price is <base-price>
    When the user attempts to book a reservation at <reservation-time>
    Then the ticket price should be <result-price>
    Examples:
      | passengers | base-price | reservation-time | result-price |
      | 2 | $50 | peak | $60 |
      | 3 | $50 | off-peak | $50 |
      | 4 | $30 | peak | $36 |
      | 1 | $100 | off-peak | $100 |

