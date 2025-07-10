Feature: Design Mobile-Friendly Interface for Easy Navigation

  As a user of the waste management system
  I want to view the locations of special waste drop-off sites on a map
  So that I can easily find where to dispose of waste responsibly

  Background:
    Given the user has a mobile device with GPS capability
    And the user has an internet connection

  Scenario: GPS functioning correctly with internet connection
    Given the GPS is functioning correctly
    And there are special waste drop-off sites available in the user's area
    When the user opens the app
    Then the map should display the locations of the special waste sites
    And the user should be able to interact with the map

  Scenario: GPS malfunctioning
    Given the GPS is malfunctioning
    When the user opens the app
    Then the map should display a message indicating that location services are disabled
    And the user cannot see their location or the available waste sites

  Scenario: No internet connection
    Given the GPS is functioning correctly
    And the user has no internet connection
    When the user opens the app
    Then the map should show an error message stating that the network is unavailable

  Scenario: Both GPS and internet services are active
    Given the GPS is functioning correctly
    And the internet connection is stable
    When the user opens the app
    Then the map should display the locations of the special waste sites
    And the user should experience seamless navigation to view and interact with the locations

  Scenario: GPS functioning but no internet connection
    Given the GPS is functioning correctly
    And there are special waste drop-off sites available in the user's area
    When the user tries to access the app without internet connection
    Then the app should inform the user that the special waste drop-off sites cannot be displayed

  Scenario: GPS malfunctioning with internet connection
    Given the GPS is malfunctioning
    And there are special waste drop-off sites available in the user's area
    When the user opens the app
    Then the app should indicate that location services are disabled
    And display waste site options without showing their locations
