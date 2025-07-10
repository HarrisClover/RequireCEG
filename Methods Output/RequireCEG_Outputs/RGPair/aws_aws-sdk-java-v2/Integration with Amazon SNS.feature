Feature: Integration with Amazon SNS

  As a system administrator
  I want to handle API calls to list topics in Amazon SNS
  So that I can ensure proper error handling and provide accurate information to users

  Background:
    Given the system is configured to communicate with Amazon SNS
    And the user has provided valid request parameters

  Scenario: Scenario 1: Valid request with topics
    Given the user is logged in with appropriate permissions
    And a valid API call is made to list SNS topics
    When the system processes the request
    Then the system returns a list of topics
    And the response format conforms to SNS specifications

  Scenario: Scenario 2: Malformed request parameters
    Given the user submits an API call with malformed parameters
    When the system processes the request
    Then the system responds with an error code indicating malformed request parameters
    And the error message indicates the nature of the input issue

  Scenario: Scenario 3: Insufficient permissions
    Given the user is logged in but lacks permission
    When the user attempts to list SNS topics
    Then the system responds with an error message stating 'Insufficient Permissions'

  Scenario: Scenario 4: Topic existence check
    Given the user provides a valid topic name
    When the system checks the existence of the topic
    Then if the topic exists, the system returns detailed information about the topic
    And if the topic does not exist, the system indicates that the topic does not exist

  Scenario: Scenario 5: Validity and Existence Check for Topics
    Given the user has submitted a request to validate a topic
    When the system checks both the validity of the topic name and its existence
    Then the system ensures that all response formats conform to Amazon SNS specifications
