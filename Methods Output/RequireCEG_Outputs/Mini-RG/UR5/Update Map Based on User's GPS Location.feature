Feature: Update Map Based on User's GPS Location

  As a user
  I want to see special waste drop-off sites on the map
  So that I can easily find locations to dispose of waste responsibly

  Background:
    Given the user has an active internet connection
    And the user's device's GPS functionality is working correctly

  Scenario: Scenario 1: Map shows special waste drop-off sites
    Given the GPS is working
    And there are special waste drop-off sites nearby
    When the user opens the map
    Then the map displays special waste drop-off sites
    And no error messages are shown

  Scenario: Scenario 2: GPS malfunction
    Given the GPS functionality is malfunctioning
    When the user opens the map
    Then no special waste drop-off sites are displayed
    And an error message indicating GPS issues is shown

  Scenario: Scenario 3: No sites nearby
    Given the GPS is working
    And there are no special waste drop-off sites within the vicinity
    When the user opens the map
    Then the map remains blank
    And no error messages are shown

  Scenario: Scenario 4: Internet connection is down
    Given the GPS functionality is working correctly
    When the user opens the map without an internet connection
    Then the map does not display any information about special waste sites
    And an error message indicating lack of internet connection is shown

  Scenario: Scenario 5: GPS issues with active connection
    Given the user has an active internet connection
    And the GPS functionality is malfunctioning
    When the user opens the map
    Then the map displays a blank map due to a malfunctioning GPS
    And an error message for GPS issues is shown

  Scenario Outline: Scenario Outline: Mixed conditions
    Given the internet connection is <internet-status>
    And the GPS functionality is <gps-status>
    When the user opens the map
    Then the map should display <map-status>
    Examples:
      | internet-status | gps-status | map-status |
      | active | working | special waste drop-off sites |
      | active | malfunctioning | no sites available |
      | down | working | no sites available |
      | down | malfunctioning | no sites available |

