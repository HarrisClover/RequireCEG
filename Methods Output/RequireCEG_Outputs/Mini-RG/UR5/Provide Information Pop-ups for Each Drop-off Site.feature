Feature: Provide Information Pop-ups for Each Drop-off Site

  As a user of the waste management system
  I want to see a map with special waste drop-off sites and their information
  So that I can easily locate and understand the drop-off options available to me

  Background:
    Given the GPS functionality is operational
    And there are identified special waste drop-off sites within the vicinity

  Scenario: Display Map with Drop-off Sites
    Given the GPS functionality is operational
    And there are identified special waste drop-off sites within the vicinity
    When I view the map
    Then the map displays markers for each drop-off site
    And clicking on a marker shows an information pop-up with details such as address, operating hours, and types of waste accepted

  Scenario: No Drop-off Sites Available in Vicinity
    Given the GPS functionality is operational
    And there are no special waste drop-off sites available in the vicinity
    When I view the map
    Then the map shows no markers or information pop-ups

  Scenario: GPS Not Functioning
    Given the GPS functionality is not functioning correctly
    When I attempt to view the map
    Then the map is suppressed, and no markers or pop-up information is displayed

  Scenario: Internet Disruption
    Given the GPS functionality is operational
    And there is a disruption in the internet connection
    When I attempt to view the map
    Then the map is suppressed, and no markers or pop-up information is displayed

  Scenario Outline: Scenario Outline: Varying GPS and Internet States
    Given the GPS functionality is <gps-status>
    And the internet connection is <internet-status>
    When I attempt to view the map
    Then the map is <map-status>
    Examples:
      | gps-status | internet-status | map-status |
      | operational | operational | displayed with markers |
      | operational | disrupted | suppressed |
      | not functioning | operational | suppressed |
      | not functioning | disrupted | suppressed |

