Feature: Handle StrictMode Violations

  As a system administrator
  I want to automatically capture and report StrictMode violations
  So that I can efficiently track and resolve issues affecting system integrity

  Background:
    Given the system is running with StrictMode enabled
    And there is a mechanism to retrieve user information upon violation

  Scenario: Capture violation details as unhandled exception
    Given a StrictMode violation occurs
    Then the system should capture the violation details as an unhandled exception
    And the error class and message should be recorded along with the severity level of the violation

  Scenario: Handle null pointer dereferencing
    Given the violation is due to null pointer dereferencing
    Then specific details regarding null pointer dereferencing should be included in the exception payload

  Scenario: Handle stack overflow violations
    Given the violation is due to a stack overflow
    Then specific details regarding the stack overflow should be included in the exception payload

  Scenario: Attach user information to violation report
    Given user information is available at the time of violation
    Then the report should include user information for context

  Scenario: Prevent duplicate reports
    Given a report related to the current violation already exists
    When the severity level remains unchanged
    Then no new report should be sent for the same issue

  Scenario: Update handled reports to unhandled
    Given a previously reported handled violation now occurs again
    Then the report status should update to unhandled while preserving original metadata

  Scenario: Aggregate multiple violations in a session
    Given multiple StrictMode violations are detected within one user session
    Then all reports should include relevant application and device metadata

  Scenario Outline: Log breadcrumbs for each violation
    Given a StrictMode violation is triggered
    When the violation details are logged
    Then breadcrumbs should be accurately logged within error reports
    Examples:
      | Violation Type | Error Class | User Info | Breadcrumbs |
      | Null Pointer | NullPointerException | User123 | Step1->Step2->Step3 |
      | Stack Overflow | StackOverflowError | User456 | StepA->StepB |

