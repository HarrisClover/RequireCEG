Feature: Alter API Key Support

  As a system administrator
  I want to update the API key with validation
  So that I can ensure that the API key is in the correct format and avoid disruptions

  Background:
    Given the API key is currently set
    And the system is functioning correctly

  Scenario: Scenario 1: Valid API Key Update
    Given the user initiates a request to change the API key
    And the new API key is valid according to the designated specifications
    When the system examines the format of the new API key
    Then the system updates the Bugsnag notifier with the new API key
    And the user receives a confirmation message indicating the successful update

  Scenario: Scenario 2: Invalid API Key Update
    Given the user initiates a request to change the API key
    And the new API key has an invalid format
    When the system examines the format of the new API key
    Then the system generates an error message detailing the nature of the issue

  Scenario: Scenario 3: Active Error Reporting During API Key Change
    Given the user initiates a request to change the API key while error reporting is active
    And the new API key is valid
    When the system updates the API key
    Then All gathered breadcrumbs and error reports are associated with the accurately designated API key
    And the system generates a confirmation message indicating a successful update

  Scenario Outline: Scenario Outline: API Key Change During Active Error Reporting
    Given the user initiates a request to change the API key while error reporting is active
    And the new API key is valid
    When the system updates the API key
    Then all error reports associated with the previous API key are preserved and correctly linked
    Examples:
      | API Key | Active Reporting Status | Outcome |
      | ValidKey123 | True | Reports are preserved and linked |
      | InvalidKey456 | True | Error message is generated for invalid key |
      | AnotherValidKey789 | False | Reports are linked without interruption |

