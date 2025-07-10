Feature: Log Manual Events as Breadcrumbs

  As a system administrator
  I want to log user manual events as breadcrumbs for error analysis and tracking
  So that I can monitor user actions and diagnose issues effectively

  Background:
    Given the system is initialized
    And the user is logged into the system

  Scenario: Scenario 1: Log a User Event
    Given a user performs a manual event
    When the event is logged
    Then a breadcrumb entry should be created
    And the breadcrumb should be uniquely identified

  Scenario: Scenario 2: Handle Significant Events
    Given a significant user event occurs
    When the system logs this event
    Then the breadcrumb should be assigned a high severity level

  Scenario: Scenario 3: Log Events with Metadata
    Given a user provides additional metadata with their event
    When the event is logged
    Then the metadata should be formatted and appended to the breadcrumb

  Scenario: Scenario 4: Include Breadcrumbs in Error Reports
    Given an unhandled exception occurs during event logging
    When the system generates an error report
    Then the relevant breadcrumbs should be included in the error report

  Scenario: Scenario 5: Sanitize User Data
    Given the user-generated data contains unusual strings or special characters
    When the data is logged
    Then the system should sanitize the data before logging

  Scenario: Scenario 6: Notify Bugsnag
    Given the Bugsnag notifier is initialized
    And the user session is valid
    When manually logged events are created
    Then all logged breadcrumbs should be reflected in the error reports

  Scenario Outline: Scenario Outline: Log Breadcrumbs with Unhandled Exceptions
    Given an unhandled exception occurs during event logging
    And the user performed <number> manual actions
    When the system generates an error report
    Then the relevant breadcrumbs should be included in the error report
    Examples:
      | number | outcome |
      | 1 | Breadcrumbs related to the exception recorded |
      | 2 | All event breadcrumbs captured for analysis |

