Feature: Ensure Proper Handling of Query Parameters

  As a user of the REST Mock service
  I want to have correctly filtered responses based on query parameters
  So that I can retrieve the appropriate resources without confusion

  Background:
    Given the user wants to make a request to the REST Mock service
    And the user has defined relevant query parameters

  Scenario: Scenario 1: Retrieve active resources
    Given the 'status' parameter is set to 'active'
    When the user sends a request without the 'type' parameter
    Then the response should contain only active resources

  Scenario: Scenario 2: Retrieve premium resources
    Given the 'type' parameter is set to 'premium'
    When the user sends a request without the 'status' parameter
    Then the response should contain all premium resources

  Scenario: Scenario 3: Retrieve active premium resources
    Given the 'status' parameter is set to 'active'
    And the 'type' parameter is set to 'premium'
    When the user sends a request
    Then the response should contain only active premium resources

  Scenario: Scenario 4: Default resource retrieval
    Given the user does not include 'status' or 'type' parameters in the request
    When the user sends a request
    Then the response should contain all available resources, limited to 10 items

  Scenario: Scenario 5: Modify limit parameter
    Given the user sets the 'limit' parameter to a lower value
    And the 'status' parameter is active
    When the user sends a request
    Then the response should contain the specified number of active resources

  Scenario: Scenario 6: Ensure correct limit parameter
    Given the 'limit' parameter is present
    When the user sends a request with limit=5
    Then the response should contain up to 5 resources based on the 'limit' parameter

  Scenario Outline: Scenario Outline: Invalid query parameters
    Given the user provides malformed '<parameter>'
    When the user sends a request
    Then the system should log an error message
    And the user should receive a notification indicating the specific issue
    Examples:
      | parameter | error message |
      | status=active&type=prmium | Malformed parameter: type |
      | limit=abc | Invalid format for limit |
      | status=invalidStatus | Invalid status value |

