Feature: Render Map with Available Drop-off Sites

  As a user of the waste disposal system
  I want to view special waste drop-off sites on the map
  So that I can conveniently locate the nearest disposal sites

  Background:
    Given the user's GPS functionality is operational
    And there are special waste drop-off sites available in the area

  Scenario: Map is displayed with available drop-off sites
    Given the user's GPS is functioning correctly
    And there are special waste drop-off sites within the vicinity
    When the user requests to view the map
    Then the map should display the available drop-off sites
    And the locations should be clearly marked

  Scenario: Map is not displayed due to GPS malfunction
    Given the user's GPS is not functioning
    When the user requests to view the map
    Then the map should not display any drop-off sites

  Scenario: Map is not displayed due to no available drop-off sites
    Given the user's GPS is functioning correctly
    And there are no special waste drop-off sites in the area
    When the user requests to view the map
    Then the map should not display any drop-off sites

  Scenario: Map is not displayed due to internet disconnection
    Given the user's GPS is functioning correctly
    And there are special waste drop-off sites available in the area
    When the internet connection is unavailable
    Then the map should not display any drop-off sites

  Scenario: Map is not displayed when GPS is malfunctioning and no internet
    Given the user's GPS is not functioning
    And the internet connection is unavailable
    When the user requests to view the map
    Then the map should not display any drop-off sites

  Scenario Outline: Scenario Outline: Impact of GPS and Internet Status
    Given the GPS status is <GPS-status>
    And the internet connection is <internet-status>
    When the user requests to view the map
    Then the map display should reflect <expected-display>
    Examples:
      | GPS-status | internet-status | expected-display |
      | functioning | available | display available drop-off sites |
      | not functioning | available | not display any drop-off sites |
      | functioning | down | not display any drop-off sites |
      | not functioning | down | not display any drop-off sites |

