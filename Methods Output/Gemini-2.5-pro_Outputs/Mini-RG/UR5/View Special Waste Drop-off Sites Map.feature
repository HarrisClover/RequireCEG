Feature: View Special Waste Drop-off Sites Map
  As a user concerned about proper waste disposal,
  I want to view a map displaying special waste drop-off sites near my location,
  So that I can easily find where to take my special waste items.

  Scenario: Successfully viewing nearby special waste sites
    Given the user has granted location permissions
    And the device has a working internet connection
    And the GPS is functioning correctly and determines the user's location
    And there are special waste drop-off sites available near the user's location
    When the user navigates to the special waste site map view
    Then the map should display markers for the nearby special waste drop-off sites
    And the user's current location should be indicated on the map

  Scenario: No special waste sites available nearby
    Given the user has granted location permissions
    And the device has a working internet connection
    And the GPS is functioning correctly and determines the user's location
    And there are no special waste drop-off sites available near the user's location
    When the user navigates to the special waste site map view
    Then the map should not display any markers for special waste drop-off sites
    And a message indicating "No nearby special waste sites found" should be displayed

  Scenario: GPS is not working or location permission denied
    Given the user has not granted location permissions OR the GPS cannot determine the location
    And the device has a working internet connection
    When the user navigates to the special waste site map view
    Then the map should not display markers based on the user's current location
    And a message should be displayed indicating that location services are required or unavailable

  Scenario: No internet connection available
    Given the device does not have a working internet connection
    When the user attempts to navigate to the special waste site map view
    Then the map view should fail to load properly
    And an error message indicating "No internet connection" should be displayed
    And no special waste site markers should be displayed