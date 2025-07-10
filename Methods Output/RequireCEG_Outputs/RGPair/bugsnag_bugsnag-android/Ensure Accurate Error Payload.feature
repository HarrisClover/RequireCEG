Feature: Ensure Accurate Error Payload

  As a system administrator
  I want to capture and log errors accurately
  So that I can diagnose issues effectively and maintain system stability

  Background:
    Given the system is running
    And user data and session information are available

  Scenario: Scenario 1: Capture Native Crash
    Given a native crash occurs
    When the crash is detected
    Then the error class should be logged
    And the error message and severity level should be included

  Scenario: Scenario 2: Handle Null Pointer Dereference
    Given a null pointer dereference happens
    When the system captures the error
    Then the error payload should include details about the variable causing the dereference
    And the state of that variable at the time of the error should be logged

  Scenario: Scenario 3: Log Stack Overflow Exceptions
    Given a stack overflow exception occurs
    When the error is reported
    Then relevant device information should be logged
    And app metadata such as app version should be included

  Scenario: Scenario 4: StrictMode Violation Handling
    Given a StrictMode violation is detected
    When the event is logged
    Then the system should ensure no duplicate entries are created

  Scenario: Scenario 5: Evaluate ANR Impact
    Given an Application Not Responding (ANR) event occurs
    When the system assesses performance
    Then response times and resource usage should be included in the error payload

  Scenario: Scenario 6: Validate User Data
    Given unusual strings appear in user data
    When the system validates functionality
    Then metadata filtering should ensure sensitive information is protected

  Scenario: Scenario 7: Confirm Bugsnag Notifier Status
    Given the Bugsnag notifier is initialized
    When session tracking is confirmed
    Then error contexts and previous events should be accurately represented

  Scenario: Scenario 8: Generate and Verify Breadcrumbs
    Given manual breadcrumbs are generated
    And automatic breadcrumbs are generated
    When the system logs interactions
    Then the breadcrumbs should be verified for correct logging within error reports

  Scenario Outline: Scenario Outline: Capture Handled Exceptions
    Given a handled exception occurs
    When the exception is caught
    Then the payload should be tagged appropriately to reflect the handling state
    Examples:
      | exception type | caught state |
      | IOException | handled |
      | SQLException | handled |

