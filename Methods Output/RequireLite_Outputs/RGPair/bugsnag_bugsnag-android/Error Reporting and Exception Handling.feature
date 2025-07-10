Feature: Error Reporting and Exception Handling

  As a developer
  I want to capture and report crashes and exceptions effectively
  So that I can enhance the stability and performance of the application

    Given the application is running in a production environment
    And error monitoring is enabled

  Scenario: Scenario 1: Report Unhandled Exception
    Given a null pointer dereference occurs
    When the unhandled exception is generated
    Then the error should be reported with the correct payload data
    And duplicate error reports should be avoided

  Scenario: Scenario 2: Handle ANR in JVM
    Given an Application Not Responding (ANR) event is triggered
    When the ANR occurs in JVM code
    Then the ANR should be reported with specified impact details collected using defined metrics

  Scenario Outline: Scenario Outline: Custom Metadata Reporting
    Given the Bugsnag notifier is initialized
    When an error occurs in the application
    Then the error report should include relevant metadata
    And custom metadata is added as <metadata>
    Examples:
      | metadata | event |
      | user_id: 123 | login failure |
      | session_id: abc-456 | transaction error |
      | custom_key: test_value | data processing error |
      | order_id: xyz-789 | checkout failure |
      | error_code: 500 | server error |

