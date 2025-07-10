Feature: Prevent Browser Caching of Sensitive Data

  As a system administrator
  I want to apply cache control headers on sensitive data pages
  So that confidential information is protected from unauthorized access

  Background:
    Given a user navigates to a page containing sensitive data
    And the user is logged into the system

  Scenario: Scenario 1: Check Cache Control Headers
    Given the system detects that the page contains sensitive information
    When the page is requested by the user
    Then the response headers should include 'Cache-Control: no-store, no-cache, must-revalidate'
    And the response should include 'Pragma: no-cache'

  Scenario: Scenario 2: Display Sensitive Information Message
    Given the user is on a sensitive data page
    When the page is loaded
    Then a message indicating 'Sensitive information will not be cached to ensure confidentiality' should be displayed

  Scenario: Scenario 3: Monitor Caching Attempts
    Given the user attempts to access a sensitive data page without proper parameters
    And the system is configured to log unauthorized access attempts
    When the request is made
    Then the system should log the caching attempt

  Scenario Outline: Scenario Outline: Log Caching Attempts Based on User Credentials
    Given the system detects that caching control is enabled for sensitive data
    And the user attempts to access the page
    When the request contains different access levels
    Then the system should log if the access is unauthorized
    Examples:
      | User-Agent | Page | Access Level | Outcome |
      | Browser A | Sensitive Page 1 | Unauthorized | Log entry created |
      | Browser B | Sensitive Page 2 | Authorized | No log entry created |
      | Browser C | Sensitive Page 3 | Unauthorized | Log entry created |

