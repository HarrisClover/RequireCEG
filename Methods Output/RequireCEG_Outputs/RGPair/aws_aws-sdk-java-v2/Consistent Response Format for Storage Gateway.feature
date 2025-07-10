Feature: Consistent Response Format for Storage Gateway

  As an API user
  I want to retrieve a list of gateways with their IDs and statuses
  So that I can effectively manage my AWS Storage Gateway resources

  Background:
    Given the user has valid access to the AWS Storage Gateway API
    And the user knows the expected format for request parameters

  Scenario: Successful retrieval of gateways
    Given the user submits a valid API call to list gateways
    When the system processes the request
    Then the response should be a JSON object containing the gateway IDs and statuses
    And the response should have consistent key names for clarity

  Scenario: Invalid gateway identifiers
    Given the user submits a request with invalid gateway identifiers
    When the system processes the request
    Then the system should return a standardized error message with an error code and a descriptive message
    And the error message should specify the identifiers are invalid

  Scenario: Malformed request parameters
    Given the user submits a request with incorrect or malformed parameters
    When the system processes the request
    Then the system should detect the invalid input
    And the system should return an error response detailing the nature of the input error with a clear and actionable message

  Scenario: Request parameters do not conform to accepted formats
    Given the user submits a request with parameters that do not conform to accepted formats
    When the system processes the request
    Then the system should return an error response detailing the nature of the input error with a clear and actionable message

  Scenario: Request contains incorrect or malformed parameters
    Given the user submits a request containing incorrect or malformed parameters
    When the system processes the request
    Then the system should return an error response detailing the nature of the input error with a clear and actionable message
    And the response should indicate which parameters were invalid

  Scenario Outline: Response structure validation
    Given the user submits a request with <parameter-type>
    When the system processes the request
    Then the response should have a structured format with consistent key names
    Examples:
      | parameter-type | example |
      | valid identifiers | example for valid identifiers |
      | invalid identifiers | example for invalid identifiers |
      | malformed parameters | example for malformed parameters |

