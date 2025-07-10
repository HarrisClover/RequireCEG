Feature: Consistent Response Format for SES

  As a user of the Amazon SES API
  I want to receive a structured and consistent response when listing email identities
  So that I can easily understand the results of my request

  Background:
    Given the user is authenticated and authorized to access email identities
    And the user has made an API request to list email identities

  Scenario: Scenario 1: Successful retrieval of existing email identities
    Given the user has one or more existing email identities configured
    When the user sends a request to list email identities
    Then the response should contain a key 'emailIdentities' with an array of email addresses
    And the response should follow the specified structure for success

  Scenario: Scenario 2: No email identities configured for the user
    Given the user has no email identities configured
    When the user sends a request to list email identities
    Then the response should contain a key 'emailIdentities' mapping to an empty array
    And the structure of the response should still adhere to the success format

  Scenario: Scenario 3: Non-existent identity requested
    Given the user requests an email identity that does not exist in the system
    When the user sends a request to list email identities
    Then the response should include an error message detailing the issue
    And the response should contain a 'Resource Not Found' error code

  Scenario: Scenario 4: Invalid request parameters
    Given the user has provided incorrect or invalid request parameters
    When the user sends a request to list email identities
    Then the response should include a structured error message indicating specific parameter issues
    And the response should provide sufficient details for remediation

  Scenario: Scenario 5: Valid request with at least one existing identity
    Given the user has one or more existing email identities
    When the user sends a request to list email identities
    Then the response should return a JSON response with key 'emailIdentities' containing an array of email addresses

  Scenario: Scenario 6: Invalid identity does not exist
    Given the provided email identity does not exist in the system
    When the user sends a request to list email identities
    Then the response should return an error message detailing the issue with a 'Resource Not Found' error code

  Scenario: Scenario 7: User with no email identities
    Given the user has no configured email identities
    When the user sends a request to list email identities
    Then the response should indicate that no identities are configured
    And return a JSON with key 'emailIdentities' mapping to an empty array
