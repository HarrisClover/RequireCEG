Feature: Verify Internet Connection Status

  As a user of the waste management application
  I want to ensure that my internet and GPS are functioning properly
  So that I can access the waste drop-off site information accurately

  Background:
    Given the user is connected to the internet
    And the GPS service is enabled

  Scenario: Scenario 1: Special waste drop-off sites available
    Given the system can access the waste drop-off site database
    And the user is connected to the internet
    And the GPS service is enabled
    When the user requests to view the drop-off sites
    Then the map should display the available special waste drop-off sites
    And the user should see a list of site addresses

  Scenario: Scenario 2: No special waste drop-off sites available
    Given the system has access to the waste drop-off site database
    And there are no special waste drop-off sites available
    When the user requests to view the drop-off sites
    Then the map should indicate that no special waste drop-off sites were found

  Scenario: Scenario 3: Internet connection required
    Given the user's internet connection status is disconnected
    And the user's GPS status is enabled
    When the user tries to access the drop-off site feature
    Then the response should be Internet connection required

  Scenario: Scenario 4: GPS required
    Given the user's internet connection status is connected
    And the user's GPS status is disabled
    When the user tries to access the drop-off site feature
    Then the response should be GPS is required to find sites

  Scenario Outline: Scenario Outline: Check for internet and GPS status
    Given the user's internet connection status is <internet-status>
    And the user's GPS status is <gps-status>
    When the user tries to access the drop-off site feature
    Then the response should be <response-message>
    Examples:
      | internet-status | gps-status | response-message |
      | connected | enabled | Display drop-off sites |
      | disconnected | enabled | Internet connection required |
      | connected | disabled | GPS is required to find sites |

