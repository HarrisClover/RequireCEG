Feature: Consistent Response Format for SNS

  As a user of the SNS service
  I want to list available SNS topics
  So that I can manage my messaging efficiently

  Background:
    Given the system is operational
    And the user has access to the SNS service

  Scenario: Scenario 1: Missing Parameters
    Given the user sends a request without required parameters
    When the system processes the request
    Then the response status code is 400
    And the response message is 'Bad request: missing parameters.'

  Scenario: Scenario 2: Invalid Topic Name
    Given the user sends a request with an invalid topic name
    When the system processes the request
    Then the response status code is 404
    And the response message is 'Topic not found.'

  Scenario: Scenario 3: Insufficient Permissions
    Given the user lacks sufficient IAM permissions
    When the user requests to list SNS topics
    Then the response status code is 403
    And the response message is 'Access denied: insufficient permissions.'

  Scenario: Scenario 4: No Topics Available
    Given the request is valid and the user has appropriate permissions
    When the user requests to list SNS topics
    Then the response is an empty array
    And the response message is 'No topics found.'

  Scenario: Scenario 5: Successful Request
    Given the request is valid and the user has appropriate permissions
    When the user requests to list available SNS topics
    Then the response contains a JSON object with topic names and their ARNs
    And the response is uniform and informative

  Scenario: Scenario 6: Valid Request with Insufficient Permissions
    Given the request is valid but the user lacks sufficient IAM permissions
    When the user requests to list SNS topics
    Then the response status code is 403
    And the response message is 'Access denied: insufficient permissions.'
