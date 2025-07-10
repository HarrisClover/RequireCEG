Feature: Provide Logging for User Interactions and Errors

  As a system administrator
  I want to log all user actions and operational errors
  So that I can track user activities and troubleshoot issues effectively

  Background:
    Given the logging system is operational
    And the user is authenticated

  Scenario: Create REST Mock Service
    Given a user initiates the creation of a REST Mock service
    When the user completes the service creation
    Then a log entry is generated with the timestamp, username, and service details for created REST Mock service
    And the log entry includes the service configuration settings

  Scenario: Edit SOAP Mock Service
    Given a user selects an existing SOAP Mock service to edit
    When the user submits the changes
    Then a log entry is created capturing the timestamp and username
    And the entry includes the previous state and changes made to the service

  Scenario: Delete Mock Resource
    Given a user chooses to delete a mock resource
    When the user confirms the deletion
    Then the system logs the deletion action including resource details
    And the log entry captures the username of the individual who performed the deletion

  Scenario: Operation Error Handling
    Given an operational error occurs during synchronization
    When the error is detected by the system
    Then an error message is logged that includes the nature of the error and the affected username
    And the log entry includes a detailed stack trace

  Scenario: Token Expiration Handling
    Given a user tries to use an expired access token
    And the user has a refresh token available
    When the system attempts to refresh the token
    Then the system logs the event of expired token usage
    And the log specifies whether the refresh attempt was successful or failed

  Scenario: Expired Token Logging
    Given a user attempts to continue using an expired access token
    Then the system logs expired access token usage and refresh attempt success or failure

  Scenario: Non-Existent Token Attempt
    Given a user makes a token refresh attempt with C6 being true
    When the token refresh attempt is made
    Then the log entry should confirm that the token refresh was attempted but the expired token cannot be refreshed
    And the system logs the failure of token refresh
