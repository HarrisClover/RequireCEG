Feature: Enable Processing Within Plugin Interface

  As a system administrator
  I want to ensure that custom metadata is processed correctly during error reporting
  So that the error reports reflect accurate system states and user interactions

  Background:
    Given the application is initialized with multiple plugins
    And a custom metadata structure is defined

  Scenario: Scenario 1: Handle Custom Metadata in Error Payload
    Given a custom metadata is added to the error payload
    And the custom metadata is incorporated into the existing error structure without alteration
    When an exception occurs
    Then the custom metadata should be included in the error report
    And the application ensures the custom metadata is incorporated correctly

  Scenario: Scenario 2: Process Unhandled Exception Gracefully
    Given an unhandled exception occurs in the application
    When the application attempts to log the error
    Then the custom metadata should be processed and included in the error report
    And the application handles plugin failure gracefully while capturing necessary payload data

  Scenario: Scenario 3: Ensure Accurate Reporting of Error Origin
    Given a custom metadata is added to the error payload
    When an error originates from JVM code
    Then the application sends a complete error report with custom metadata

  Scenario: Scenario 4: Reinitialize Bugsnag Notifier on API Key Change
    Given a plugin modifies the API key
    When the application detects the change
    Then the Bugsnag notifier should be reinitialized
    And all previously logged session data should be retained

  Scenario: Scenario 5: Include Manual Breadcrumbs in Error Report
    Given the application has logged manual breadcrumbs
    When an error occurs
    Then the manual breadcrumbs should be included in the final error report payload
    And all automatically generated events should also be included

  Scenario Outline: Scenario Outline: Prioritize Metadata from Primary Plugin
    Given multiple plugins are active with custom metadata
    And the primary plugin has specific metadata
    When the error is generated from any plugin
    Then the metadata from the primary plugin should take precedence
    Examples:
      | plugin | metadata | outcome |
      | Plugin A | Primary Metadata | Primary Metadata takes precedence |
      | Plugin B | Secondary Metadata | Primary Metadata takes precedence |

