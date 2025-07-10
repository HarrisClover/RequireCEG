Feature: Incorporate Visual Indicators for Available Sites

  As a user of the waste management system
  I want to see visual indicators for special waste drop-off sites
  So that I can effectively locate disposal options for my waste

  Background:
    Given the GPS is functioning correctly
    And there are available special waste drop-off sites within the user's area

  Scenario: Scenario 1: GPS functioning with available sites
    Given the GPS is functioning correctly
    And there are special waste drop-off sites within the area
    When the user opens the map
    Then visual indicators for the available special waste drop-off sites are displayed
    And the user can easily identify the locations

  Scenario: Scenario 2: GPS functioning but no sites available
    Given the GPS is functioning correctly
    And there are no special waste drop-off sites within the user's area
    When the user opens the map
    Then no visual indicators are shown on the map
    And a message 'No special waste sites available' is logged

  Scenario: Scenario 3: GPS not functioning
    Given the GPS is not functioning correctly
    When the user attempts to open the map
    Then the map remains unchanged

  Scenario: Scenario 4: Internet connection down
    Given the GPS is functioning correctly
    And the internet connection is down
    When the user opens the map
    Then no visual indicators for special waste sites are displayed
    And an error message 'Unable to connect to service, please try again later' is shown

  Scenario: Scenario 5: GPS functioning with no internet
    Given the GPS is functioning correctly
    And the internet connection is down
    When the user attempts to open the map
    Then the map remains unchanged
    And an error message 'Unable to connect to service, please try again later' is shown
