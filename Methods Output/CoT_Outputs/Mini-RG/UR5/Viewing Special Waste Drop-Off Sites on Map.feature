Feature: Viewing Special Waste Drop-Off Sites on Map
  As a user,
  I want to view the special waste drop-off sites on a map
  So that I can easily find where to drop off my special waste.

  Scenario: Viewing special waste drop-off sites when available and GPS is working
    Given that the GPS is working
    And there are special waste drop-off sites available
    When I open the map
    Then I should see the special waste drop-off sites on the map

  Scenario: Not seeing special waste drop-off sites when not available
    Given that the GPS is working
    And there are no special waste drop-off sites available
    When I open the map
    Then I should not see any special waste drop-off sites on the map

  Scenario: Not seeing special waste drop-off sites when the GPS is not working
    Given that the GPS is not working
    When I open the map
    Then I should not see any special waste drop-off sites on the map

  Scenario: Not seeing special waste drop-off sites when the internet is down
    Given that the internet connection is down
    When I open the map
    Then I should not see any special waste drop-off sites on the map
