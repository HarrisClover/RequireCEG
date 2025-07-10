Feature: Ensure Breadcrumbs are Accurate in Reports

  As a system administrator
  I want to ensure that all breadcrumbs are accurately captured and logged during user sessions
  So that I can diagnose issues effectively and understand user interactions with the system

  Background:
    Given the system is initialized with adequate logging capabilities
    And the session tracking mechanism is active

  Scenario: Scenario 1: Logging a unique breadcrumb
    Given a user triggers an event manually
    When the system logs the breadcrumb
    Then the breadcrumb should be included in the error report if an unhandled exception occurs
    And the breadcrumb should capture relevant session information after Bugsnag's initialization

  Scenario: Scenario 2: Handling duplicate breadcrumbs
    Given multiple similar user actions have occurred during the session
    When the system logs breadcrumbs for these actions
    Then only unique breadcrumbs should be included in the error report
    And duplicate breadcrumbs should be omitted from the error report's breadcrumbs

  Scenario: Scenario 3: ANR event handling
    Given the user experiences an Application Not Responding (ANR) event
    When the system logs all breadcrumbs leading up to the ANR
    Then all relevant breadcrumbs should be distinctly logged to analyze performance issues

  Scenario: Scenario 4: Unusual strings in breadcrumbs
    Given unusual strings are present in logged breadcrumbs
    When the system filters and logs any unusual strings
    Then the metadata for unusual strings should be filtered and logged gracefully

  Scenario Outline: Scenario Outline: Logging Configuration Changes
    Given the configuration changes for the API key are made
    And the breadcrumb logging system is updated with new parameters
    When the system triggers events that generate breadcrumbs
    Then the breadcrumbs should reflect the current configuration accurately
    Examples:
      | API Key Status | Logged Breadcrumb | Impact |
      | Updated | Breadcrumb A | Accurate reflection of new settings |
      | Unchanged | Breadcrumb B | Maintains previous settings |
      | Reset | Breadcrumb C | Effectively adapts to changes |

