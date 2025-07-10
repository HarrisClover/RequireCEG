Feature: Handle Native Crashes

  As a system administrator
  I want to accurately capture and log error details upon crashes
  So that I can diagnose and resolve issues effectively

  Background:
    Given the system is initialized
    And the Bugsnag notifier is set up

  Scenario: Log a general crash
    Given a native crash occurs
    When the system captures the error information
    Then the error class should be logged
    And the error message should be logged
    And the severity should be recorded
    And user information should be included in the log

  Scenario: Log a null pointer dereference
    Given a null pointer dereference crash is detected
    When the system logs the error details
    Then the crash event must be logged distinctly
    And additional metadata for diagnostics should be included

  Scenario: Log a stack overflow
    Given a stack overflow event occurs
    When the system captures the crash details
    Then the logged payload must include memory usage metrics
    And thread states at the time of the crash should be recorded

  Scenario: Log an ANR event
    Given an Application Not Responding (ANR) event is triggered
    When the system identifies the event as an unhandled exception
    Then relevant device information should be logged
    And app metadata should also be included

  Scenario: Prevent duplicate error reports
    Given multiple similar errors occur in a short period
    When the system processes the error reports
    Then duplicate error submissions should be prevented
    And the integrity and structure of the error payload must be maintained

  Scenario: Filter unusual user data
    Given user data includes unusual or non-conventional strings
    When the system processes user input
    Then the unusual strings should be filtered
    And the system functionality must not be disrupted

  Scenario: Session tracking adjustment
    Given the Bugsnag notifier is initialized with an API key
    When the API key changes
    Then session tracking must adapt to the new API key

  Scenario: Log breadcrumb events
    Given breadcrumb events are generated
    When an error report is created
    Then all breadcrumb events must be logged precisely within the report

  Scenario: Handle duplicate errors efficiently
    Given the system detects multiple similar error reports
    When the system checks for duplicates
    Then the submission of duplicate error reports must be blocked
    And only unique error submissions must be logged

  Scenario: Ensure session tracking is reliable
    Given the system is initialized with an API key
    When the Bugsnag notifier is set up
    Then session tracking must operate correctly during notifier initialization
