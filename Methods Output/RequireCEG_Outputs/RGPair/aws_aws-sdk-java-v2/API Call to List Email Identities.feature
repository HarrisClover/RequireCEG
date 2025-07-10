Feature: API Call to List Email Identities

  As a system user
  I want to retrieve email identities from Amazon SES
  So that I can manage my email sending capabilities effectively

  Background:
    Given the user has valid credentials
    And the user is authorized to access the system

  Scenario: Valid credentials with email identities
    Given the user sends a request for email identities
    When the system validates the credentials
    Then the system retrieves the email identities
    And the response is in JSON format containing the list of email identities

  Scenario: Invalid credentials
    Given the user sends a request with invalid credentials
    When the system attempts to validate the credentials
    Then the system returns a 401 error code
    And the message is 'Unauthorized access - invalid credentials.'

  Scenario: No email identities found
    Given the user has valid credentials
    And there are no existing email identities
    When the user requests for email identities
    Then the system returns a 204 No Content status
    And the message is 'No email identities found.'

  Scenario: Invalid parameters
    Given the user has valid credentials
    When the user sends a request with incorrect parameters
    Then the system returns a 400 error code
    And the message is 'Bad request - invalid parameters.'

  Scenario: Connection issue
    Given the user has valid credentials
    When the system attempts to connect to AWS services
    Then the system returns a 500 Internal Server Error response
    And the message is 'Unable to connect to AWS services - please try again later.'

  Scenario: Email identity retrieval with valid credentials and existing identities
    Given the user has valid credentials
    And there are email identities associated with the account
    When the user requests for email identities
    Then the system responds with a valid JSON format as per Amazon SES requirements
    And the response contains the list of email identities

  Scenario: Invalid request parameters
    Given the user has valid credentials
    When the user sends a request that includes incorrect parameters
    Then the system returns a 400 error code
    And the message is 'Bad request - invalid parameters.'
