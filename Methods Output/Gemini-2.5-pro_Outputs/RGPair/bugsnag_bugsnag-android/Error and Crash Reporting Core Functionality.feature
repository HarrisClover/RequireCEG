Feature: Error and Crash Reporting Core Functionality
  As a developer,
  I want the application to reliably report native crashes and exceptions from JVM and NDK code
  So that I can diagnose and fix issues effectively.

  Scenario Outline: Reporting Unhandled Exceptions/Crashes
    Given the error reporting system is initialized
    And user information is set with ID "user123" and email "test@example.com"
    When an unhandled <error_type> occurs in the <environment> environment
    Then an error report should be sent
    And the report payload should contain:
      | field         | value_includes |
      | errorClass    | <error_class>  |
      | errorMessage  | <error_message>|
      | severity      | error          |
      | unhandled     | true           |
      | user.id       | user123        |
      | user.email    | test@example.com|
      | context       | <context>      |
      | environment   | <environment>  |
    And the report should include standard device and app metadata

    Examples:
      | error_type                | environment | error_class             | error_message              | context                 |
      | Null Pointer Dereference  | JVM         | NullPointerException    | Attempt to invoke virtual method | ActivityName/MethodName |
      | Stack Overflow            | JVM         | StackOverflowError      | stack size exceeded        | DeepRecursiveCall       |
      | StrictMode Violation      | JVM         | StrictModeViolation     | disk write on main thread  | ViolatingComponent      |
      | Native Crash (Signal)     | NDK         | SIGSEGV                 | Segmentation fault         | NativeFunctionName      |

  Scenario: Reporting Handled Exceptions
    Given the error reporting system is initialized
    And user information is set with ID "user456"
    When a handled exception "CustomAppException" with message "Configuration file not found" is manually reported with severity "warning"
    Then an error report should be sent
    And the report payload should contain:
      | field         | value_includes          |
      | errorClass    | CustomAppException      |
      | errorMessage  | Configuration file not found |
      | severity      | warning                 |
      | unhandled     | false                   |
      | user.id       | user456                 |
    And the report should include standard device and app metadata

  Scenario: Avoid Duplicate Error Reports
    Given the error reporting system is initialized
    When the exact same unhandled NullPointerException occurs twice in rapid succession
    Then only one error report for that specific instance should be sent

