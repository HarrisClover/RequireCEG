Feature: Handle GPS Errors and Provide Fallback

  As a user of the waste drop-off system
  I want to be informed about the availability of waste drop-off sites based on my GPS location
  So that I can easily locate the nearest drop-off site or understand the status of the service

  Background:
    Given the user has the waste drop-off application installed
    And the user's device has location services enabled

  Scenario: GPS Signal is Strong and Sites are Available
    Given the GPS signal is strong
    When the system checks for special waste drop-off sites
    Then the sites should be displayed on the map
    And display special waste drop-off sites on the map

  Scenario: GPS Signal is Weak but Sites are Found at Last Known Location
    Given the GPS signal is weak
    And the last known location is being used
    When the system reverts to the last known location and checks for special waste drop-off sites
    Then if sites are found, they should be displayed on the map
    And revert to the last known location to check availability of drop-off sites

  Scenario: GPS is Non-functional and No Sites Available at Last Known Location
    Given the GPS is entirely non-functional
    And there are no drop-off sites available at the last known location
    When the user attempts to view the drop-off sites
    Then a message should indicate the absence of available drop-off sites
    And display a message indicating the absence of available drop-off sites

  Scenario: No Internet Connection
    Given the internet connection is down
    When the user tries to load the map
    Then a message should notify the user that the map cannot be loaded until the internet is restored
    And display a message that the map cannot be loaded until the internet is restored

  Scenario: Both GPS and Internet are Unavailable
    Given the GPS cannot determine the current location
    And the internet connection is down
    When the user tries to use the app
    Then a comprehensive message should inform the user that both services are currently unavailable
    And display a comprehensive message that both GPS and internet services are currently unavailable

  Scenario: Weak GPS Signal with Internet Available
    Given the GPS signal is weak
    And the internet connection is available
    When the system checks for special waste drop-off sites
    Then a message notifying user about potential inaccuracies is displayed
