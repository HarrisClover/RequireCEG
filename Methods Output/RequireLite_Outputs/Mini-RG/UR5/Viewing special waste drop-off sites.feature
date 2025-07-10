Feature: Viewing special waste drop-off sites

  As a community member
  I want to view a map display of special waste drop-off sites around my area
  So that I know where to drop off my special waste

  Background:
    Given the user has an active GPS
    And the user has an active internet connection

  Scenario: Scenario 1: Special waste drop-off sites available
    Given there are special waste drop-off sites in the area
    When the user checks the map
    Then the special waste drop-off sites should be displayed on the map
    And the user should be able to see the locations clearly

  Scenario: Scenario 2: No special waste drop-off sites available
    Given there are no special waste drop-off sites in the area
    When the user checks the map
    Then no special waste drop-off sites should be displayed on the map

  Scenario: Scenario 3: GPS not working
    Given the GPS is not functioning correctly
    When the user tries to view the map
    Then an error message should be displayed indicating that GPS is not available
    And no special waste drop-off sites should be displayed on the map

  Scenario: Scenario 4: Internet connection down
    Given the internet connection is down
    When the user tries to view the map
    Then an error message should be displayed indicating that an internet connection is required
    And no special waste drop-off sites should be displayed on the map

  Scenario: Scenario 5: Map application issues
    Given the map application is experiencing a bug
    When the user tries to view the map
    Then an error message should be displayed indicating a problem with the map application
    And no special waste drop-off sites should be displayed on the map

  Scenario Outline: Scenario Outline: User permissions for location services
    Given the user permissions for location services are set to '<permissions>'
    When the user tries to view the map
    Then an error message should be displayed indicating '<result>'
    Examples:
      | permissions | result |
      | granted | the special waste drop-off sites should be displayed on the map |
      | denied | no special waste drop-off sites should be displayed on the map |
      | prompted | the user should be prompted to enable location services |

