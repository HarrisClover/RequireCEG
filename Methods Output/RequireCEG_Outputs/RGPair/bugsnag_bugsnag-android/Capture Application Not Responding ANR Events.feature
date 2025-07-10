Feature: Capture Application Not Responding (ANR) Events

  As a system administrator
  I want to capture detailed payloads during ANR events
  So that I can troubleshoot and resolve application performance issues efficiently

  Background:
    Given the system is initialized with the Bugsnag notifier
    And active session tracking is enabled

  Scenario: Scenario 1: Capture ANR event from JVM
    Given an ANR event is detected within the JVM environment
    And user information includes unusual strings
    When the system compiles the ANR payload
    Then the payload includes error class, error message, and severity level
    And the payload correctly captures user information

  Scenario: Scenario 2: Capture ANR event from CXX environment
    Given an ANR event originates from the CXX environment
    When the system compiles the ANR payload
    Then the payload contains device metadata and application details

  Scenario: Scenario 3: Apply metadata filtering
    Given the user information includes unusual strings
    When the system detects these strings in the ANR event
    Then appropriate metadata filtering is applied to the user information

  Scenario: Scenario 4: Prevent duplicate error reports
    Given an ANR event is detected with a handled error type
    And the system is configured to prevent duplicate error reports
    When the error report is generated
    Then no duplicate error reports are created
    And the system accurately tags handled and unhandled exceptions

  Scenario: Scenario 5: Log breadcrumbs on ANR event
    Given breadcrumbs are created at the time of the ANR event
    When the ANR report is created
    Then the breadcrumbs are logged comprehensively within the error report

  Scenario Outline: Scenario Outline: Prevent duplicate error reports
    Given an ANR event is detected with <error-type>
    And the system is configured to prevent duplicates
    When the error report is generated
    Then no duplicate error reports are created
    And the system accurately tags handled and unhandled exceptions
    Examples:
      | error-type |
      | handled |
      | unhandled |

