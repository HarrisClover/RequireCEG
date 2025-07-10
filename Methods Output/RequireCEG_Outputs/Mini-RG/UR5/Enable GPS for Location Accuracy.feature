Feature: Enable GPS for Location Accuracy

  As a user
  I want the system to identify special waste drop-off sites near my location
  So that I can easily find where to dispose of my waste responsibly

  Background:
    Given the GPS is enabled and functioning correctly
    And the internet connection is active

  Scenario: Scenario 1: GPS Enabled and Internet Active
    Given the user has enabled GPS and has a stable internet connection
    And there are special waste drop-off sites within a 5 kilometer radius
    When the user requests to view drop-off sites
    Then the map should display the marked drop-off sites
    And the user should see appropriate icons indicating each location

  Scenario: Scenario 2: GPS Disabled
    Given the user has disabled GPS
    When the user requests to view drop-off sites
    Then the map should not display any drop-off sites
    And the user should receive a message indicating that GPS is required to locate these sites

  Scenario: Scenario 3: Internet Connection Down
    Given the GPS is enabled and functioning correctly
    When the user requests to view drop-off sites while offline
    Then the map cannot be displayed due to lack of internet connectivity
    And the user should receive a notification about the missing internet connection

  Scenario: Scenario 4: Internet Connection Inactive
    Given the GPS is enabled and functioning correctly
    And the internet connection is inactive or absent
    When the user requests to view drop-off sites
    Then the user should receive a notification stating that the map cannot be displayed due to a lack of internet connectivity
    And the user should see an appropriate message concerning the lack of internet

  Scenario: Scenario 5: No Special Waste Drop-off Sites
    Given the user has enabled GPS and has an active internet connection
    And there are no special waste drop-off sites within a 5 kilometer radius
    When the user requests to view drop-off sites
    Then the map should not display any drop-off sites
    And the user should be informed that there are no drop-off sites available in the vicinity

  Scenario Outline: Scenario Outline: Varying GPS and Internet Conditions
    Given the GPS is <gps-status>
    And the internet connection is <internet-status>
    When the user requests to view drop-off sites
    Then the system should <expected-outcome>
    Examples:
      | gps-status | internet-status | expected-outcome |
      | enabled | active | display drop-off sites on map |
      | disabled | active | notify user that GPS is required |
      | enabled | down | notify user about missing internet connection |
      | disabled | down | notify user that GPS is required and no map can be displayed |

