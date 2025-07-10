Feature: Manage Special Waste Drop-off Sites Visibility

  As a user of the waste management system
  I want the application to display special waste drop-off sites on a map and update the visibility based on availability
  So that I can see the current drop-off locations for effective disposal management

  Background:
    Given the GPS is functioning correctly
    And there is an active internet connection

  Scenario: Scenario 1: Display drop-off sites on the map
    Given the system fetches data for special waste drop-off sites
    When the user views the map
    Then the map displays the drop-off sites as markers
    And the markers show accurate locations of the sites

  Scenario: Scenario 2: Failure to determine GPS location
    Given the GPS fails to identify the user's location
    When the user attempts to view the map
    Then the system displays a message indicating location cannot be determined

  Scenario: Scenario 3: Inactive internet connection
    Given the internet connection is inactive
    When the user tries to load the map
    Then the system displays a message stating that the map cannot be loaded

  Scenario: Scenario 4: Remove markers when drop-off sites are unavailable
    Given the system is displaying drop-off site markers
    When the drop-off sites become unavailable
    Then the system automatically removes the markers for those sites

  Scenario: Scenario 5: Update map with new drop-off sites
    Given the user is viewing the map
    When new special waste drop-off sites become available
    Then the system updates the map to reflect new site markers

  Scenario: Scenario 6: Handle GPS failure with no drop-off sites
    Given the GPS fails to determine the accurate location
    When the user attempts to view the drop-off sites on the map
    Then the system prints a message indicating that the location cannot be determined

  Scenario: Scenario 7: Handle inactive internet and remove unavailable drop-off sites
    Given the internet connection is inactive
    When the user tries to load the map
    Then the system displays a message stating that the map cannot be loaded
    And the system automatically removes the markers for any unavailable drop-off sites
