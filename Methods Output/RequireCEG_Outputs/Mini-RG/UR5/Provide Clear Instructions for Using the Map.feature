Feature: Provide Clear Instructions for Using the Map

  As a user of the waste drop-off service
  I want to receive clear instructions about the display of special waste drop-off sites on the map
  So that I can understand whether I can access the map based on my internet and GPS status

  Background:
    Given the user initiates the request to view the waste drop-off map
    And the system checks the user's internet connection and GPS functionality

  Scenario: Scenario 1: Successful Map Display
    Given the user's internet connection is active
    And the GPS is functioning correctly
    When the system retrieves data for special waste drop-off sites
    Then the system should retrieve and display the map highlighting special waste drop-off site locations
    And the locations should be highlighted on the map

  Scenario: Scenario 2: No Special Waste Drop-off Sites Available
    Given the user's internet connection is active
    And the GPS is functioning correctly
    When the system checks for special waste drop-off sites
    Then the system should relay a message indicating 'There are no special waste drop-off sites available to display.'

  Scenario: Scenario 3: GPS Not Functioning
    Given the user's internet connection is active
    And the GPS is not functioning correctly
    When the user requests to view the map
    Then the system should refrain from displaying any special waste drop-off sites on the map

  Scenario: Scenario 4: Internet Connection Down
    Given the user's internet connection is down
    When the user attempts to access the map
    Then the system should present a message indicating 'The map cannot be displayed without internet access.'

  Scenario: Scenario 5: Internet Connection Active but GPS Not Functioning
    Given the user's internet connection is active
    And the GPS is not functioning correctly
    When the user requests to view the map
    Then the system should refrain from displaying any special waste drop-off sites on the map
    And the system should relay the appropriate message relevant to the GPS issue.

  Scenario: Scenario 6: Internet Connection Down with GPS Functioning
    Given the user's internet connection is down
    And the GPS is functioning correctly
    When the user attempts to access the map
    Then the system should present a message indicating 'The map cannot be displayed without internet access.'
