Feature: Log Automatic Events as Breadcrumbs

  As a system administrator
  I want to log automatic events as breadcrumbs
  So that I can have a comprehensive overview of user interactions and system performance for better debugging and analysis

  Background:
    Given a user is interacting with the application
    And the application is configured to log breadcrumbs

  Scenario: User navigates to a new URL
    Given the user is on the homepage
    When the user clicks on the 'Products' link
    Then a breadcrumb entry should be logged
    And the entry should include the visited URL and user action

  Scenario: Performance event logging
    Given the application is experiencing a high load
    When the application logs performance metrics
    Then a breadcrumb entry should be created
    And the entry should include the timestamp and performance details

  Scenario: Unhandled exception occurs
    Given an unhandled exception arises in the application
    When the system logs the exception
    Then a breadcrumb entry should be created
    And the entry should include the severity level and error class

  Scenario: Duplicate breadcrumb entry handling
    Given the user is on the Products page
    When the user clicks on the same product link again
    Then the existing breadcrumb entry for that product should be updated
    And the new entry should retain all previous data

  Scenario: Logging automatic events
    Given an automatic event occurs within the application
    When the system processes the event
    Then a breadcrumb entry should be logged for the automatic event
    And the entry should include relevant details of the event

  Scenario: Handling duplicate breadcrumb entries
    Given the breadcrumb entry is a duplicate of an existing entry
    When the same event type is logged
    Then the existing breadcrumb entry should be updated instead of creating a new duplicate
    And the updated entry should retain all contextual information

  Scenario Outline: Handling various automatic events
    Given an automatic event is logged with <event-type>
    When the same event occurs again
    Then the existing breadcrumb should be updated
    And the new entry should retain all previous data
    Examples:
      | event-type | description |
      | user-navigation | Logging a user navigating to a product page |
      | performance | Logging a performance metric after a high load |

