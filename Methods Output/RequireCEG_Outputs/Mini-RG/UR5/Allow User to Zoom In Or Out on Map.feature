Feature: Allow User to Zoom In Or Out on Map

  As a user
  I want to be able to zoom in and out on the waste drop-off site map
  So that I can better view my surroundings and find the nearest available site

  Background:
    Given the GPS is functioning correctly
    And there are available special waste drop-off sites

  Scenario: Scenario 1: Displaying Map with Available Sites
    Given the GPS is functioning correctly
    And there are multiple special waste drop-off sites available
    When the user accesses the map
    Then the map should display markers for the available special waste sites
    And the user can zoom in and out to view more details

  Scenario: Scenario 2: GPS Not Functioning
    Given the GPS is not functioning correctly
    When the user accesses the map
    Then the map should not display any markers for special waste sites
    And the user cannot zoom in or out

  Scenario: Scenario 3: No Special Waste Sites Available
    Given the GPS is functioning correctly
    And there are no special waste drop-off sites available
    When the user accesses the map
    Then the map should not display any markers for special waste sites
    And the user can still zoom in and out

  Scenario: Scenario 4: Internet Connection Down
    Given the internet connection is down
    When the user attempts to access the map
    Then the map should fail to load entirely
    And the user cannot perform any zoom actions

  Scenario: Scenario 5: Display Map When GPS and Internet are Working Together with Available Sites and Zoom Functionality Enabled for User Interaction: Display Zoom Options on Map Interaction
    Given the GPS is functioning correctly
    And there are available special waste drop-off sites
    And the user zooms in on the map
    Then the map should show detailed locations of the closest available site
    And the user should have the option to zoom out for a broader view
