Feature: Display Error Message for No Available Drop-off Sites

  As a user searching for waste drop-off sites
  I want to receive accurate feedback regarding the availability of drop-off locations
  So that I can efficiently locate special waste drop-off sites or understand when they are unavailable

  Background:
    Given the user has enabled location services
    And the user has an active internet connection

  Scenario: GPS functionality is not operational
    Given the GPS signal is unavailable
    And the user attempts to view special waste drop-off sites
    When the system checks for GPS functionality
    Then the user sees a message indicating that location services are unavailable
    And the map does not display any drop-off sites

  Scenario: Internet connection is down
    Given the internet connection is not functioning
    When the user tries to access special waste drop-off site locations
    Then the user receives an alert to check their internet connection
    And the map does not show any drop-off sites

  Scenario: Both GPS and Internet are functioning
    Given the GPS is operational
    And the internet connection is working
    When the system queries for available special waste drop-off sites
    Then the user sees all nearby special waste drop-off sites on the map

  Scenario: No special waste drop-off sites available
    Given the GPS and internet are both functional
    When the system queries for drop-off sites and finds none
    Then the user receives an error message stating 'No special waste drop-off sites available in your area'

  Scenario: Both GPS and Internet are functioning but query returns no results
    Given the GPS is operational
    And the internet connection is working
    When the user attempts to view special waste drop-off sites
    Then the system performs a query for special waste drop-off sites and finds none
    And the user receives an error message stating 'No special waste drop-off sites available in your area'
