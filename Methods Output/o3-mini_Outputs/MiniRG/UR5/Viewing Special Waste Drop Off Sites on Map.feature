Feature: Viewing Special Waste Drop Off Sites on Map
  As a user,
  I want to view a map display of the special waste drop off sites around my area,
  So that I know where to drop off my special waste.

  # Scenario: Display special waste drop off sites when all conditions are met.
  Scenario: Display drop off sites when they are available, GPS works, and internet connection is up
    Given special waste drop off sites are available
    And the GPS is working correctly
    And the internet connection is active
    When I open the special waste drop off map
    Then I should see the special waste drop off sites on the map

  # Scenario: Do not display sites when no special waste drop off is available.
  Scenario: Do not display drop off sites when none are available
    Given no special waste drop off sites are available
    And the GPS is working correctly
    And the internet connection is active
    When I open the special waste drop off map
    Then I should not see any special waste drop off sites on the map

  # Scenario: Do not display sites when the GPS is not working.
  Scenario: Do not display drop off sites when the GPS is not functioning
    Given special waste drop off sites are available
    And the GPS is not working correctly
    And the internet connection is active
    When I open the special waste drop off map
    Then I should not see any special waste drop off sites on the map

  # Scenario: Do not display sites when the internet connection is down.
  Scenario: Do not display drop off sites when the internet connection is down
    Given special waste drop off sites are available
    And the GPS is working correctly
    And the internet connection is down
    When I open the special waste drop off map
    Then I should not see any special waste drop off sites on the map
