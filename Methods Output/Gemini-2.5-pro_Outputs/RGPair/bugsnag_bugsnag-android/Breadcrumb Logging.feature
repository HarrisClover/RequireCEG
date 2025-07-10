Feature: Breadcrumb Logging
  As a developer,
  I want user actions and system events (breadcrumbs) logged and included in error reports
  So that I can understand the sequence of events leading up to an error.

  Scenario: Automatic Breadcrumbs in Report
    Given the error reporting system is initialized
    And automatic breadcrumb collection (e.g., Activity lifecycle, network requests) is enabled
    When the user navigates from "ActivityA" to "ActivityB"
    And a network request to "/api/data" is made
    And an error occurs in "ActivityB"
    Then the error report payload should contain breadcrumbs
    And the breadcrumbs should include entries like "Activity Started: ActivityA", "Activity Stopped: ActivityA", "Activity Started: ActivityB", "Network Request: GET /api/data" (or similar)

  Scenario: Manual Breadcrumbs in Report
    Given the error reporting system is initialized
    When the user performs action "Login Button Clicked" and a manual breadcrumb is left with this message and type "user"
    And the user performs action "Data Save Attempt" and a manual breadcrumb is left with this message and type "state" and metadata {"record_id": 5}
    And an error occurs shortly after
    Then the error report payload should contain breadcrumbs
    And the breadcrumbs should include the manual entries:
      | message              | type | metadata        |
      | Login Button Clicked | user |                 |
      | Data Save Attempt    | state| {"record_id": 5}|

  Scenario: Breadcrumb Limits Respected
    Given the error reporting system is initialized
    And the maximum breadcrumb limit is configured to 25
    When 30 breadcrumbs (mix of automatic and manual) are generated
    And an error occurs
    Then the error report payload should contain exactly 25 breadcrumbs
    And the included breadcrumbs should be the *most recent* 25 generated before the error.