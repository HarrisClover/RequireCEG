Feature: Error Reporting and Handling System

As a developer,
I want the application to capture and report native crashes and unhandled exceptions
So that I can monitor, analyze, and resolve errors effectively to improve app performance

Scenario Outline: Capture and Report Native Crashes and Exceptions
Given that the application is configured to report native crashes and unhandled exceptions
And the system is initialized with the appropriate error payload structure
When an error occurs due to <error-type>
Then the error report should include the following:
  | Error Class     | Error Message          | Severity | User Information | Device Information |
  | <error-class>   | <error-message>        | <severity> | <user-info>      | <device-info>      |
And the error report should be properly tagged as <handled-or-unhandled> exception
And the error report should not contain duplicate entries
And the metadata should be filtered appropriately for unusual strings

Examples:
  | error-type                | error-class     | error-message     | severity | user-info    | device-info   | handled-or-unhandled |
  | NullPointerException       | java.lang.NullPointerException | Null reference | High | user123 | deviceXYZ | unhandled |
  | StackOverflowError         | java.lang.StackOverflowError | Stack overflow | Critical | user123 | deviceXYZ | unhandled |
  | StrictModeViolation        | android.os.StrictModeViolation | Disk operation on main thread | Medium | user123 | deviceXYZ | handled   |
  | ANR                        | android.os.ANR | Application Not Responding | Critical | user123 | deviceXYZ | unhandled |
