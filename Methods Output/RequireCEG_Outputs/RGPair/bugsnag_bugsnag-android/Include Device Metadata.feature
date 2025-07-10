Feature: Include Device Metadata

  As a developer
  I want the application to capture essential device metadata during crashes
  So that I can troubleshoot issues effectively and improve application stability

  Background:
    Given the application is running
    And the user is logged in

  Scenario: Scenario 1: Native Crash Handling
    Given a native crash occurs
    And user data sharing is enabled
    When the crash is reported
    Then essential device metadata is captured regarding the device model, operating system version, and available memory
    And the report is sent securely

  Scenario: Scenario 2: Handling StrictMode Violation
    Given a StrictMode violation occurs
    When the error is logged
    Then the report specifies the violated StrictMode policy and relevant device logs

  Scenario: Scenario 3: Null Pointer Dereference
    Given a null pointer dereference happens
    When the application generates an error report
    Then the report includes the current app version and architecture along with relevant device logs

  Scenario: Scenario 4: NDK Code Error Reporting
    Given NDK code triggers an error
    And the architecture is specified
    When the error report is created
    Then extra context about the native environment including architecture and library versions is included

  Scenario: Scenario 5: Duplicate Error Report Handling
    Given a duplicate error report is generated
    When the system processes the reports
    Then redundant device metadata is excluded from the reports
    And a consistent structure is maintained in the error payload

  Scenario: Scenario 6: User Data Persistence Check
    Given user data persists across application sessions
    When the application retrieves user data
    Then the device metadata is updated continuously to reflect the current state for troubleshooting
