Feature: Enable Route Navigation to Selected Drop-off Site

  As a user of the navigation system
  I want the navigation features to function smoothly
  So that I can reach my selected drop-off site without issues

  Background:
    Given the system is operational
    And the user has logged in

  Scenario: Scenario 1: GPS Signal Active
    Given the GPS status is functional
    And the internet connection is active
    When the user selects a drop-off site
    Then the route navigation should be enabled
    And the directions should be displayed

  Scenario: Scenario 2: GPS Signal Lost
    Given the GPS status is not functional
    When the user attempts to select a drop-off site
    Then the route navigation should be disabled

  Scenario: Scenario 3: Internet Connection Lost
    Given the internet connection is not active
    When the user tries to access navigation features
    Then the route navigation should be disabled

  Scenario: Scenario 4: Both GPS and Internet Unavailable
    Given the GPS status is not functional
    And the internet connection is not active
    When the user tries to select a drop-off site
    Then the route navigation should be disabled

  Scenario Outline: Scenario Outline: GPS and Internet Status
    Given the GPS status is '<gps-status>'
    And the internet connection status is '<internet-status>'
    When the user tries to navigate to a drop-off site
    Then the route navigation should be '<navigation-status>'
    Examples:
      | gps-status | internet-status | navigation-status |
      | functional | active | enabled |
      | not functional | active | disabled |
      | functional | not active | disabled |
      | not functional | not active | disabled |

