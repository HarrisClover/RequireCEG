Feature: Error Handling for Storage Gateway API Calls

  As a system administrator
  I want to ensure validation of user inputs when listing gateways or performing actions related to them
  So that users receive clear and informative error messages in case of invalid inputs

  Background:
    Given the system is operational
    And the user has the necessary permissions to manage gateways

  Scenario: Invalid Identifier for Listing Gateways
    Given a user attempts to list gateways with an invalid identifier
    When the request to list the gateways is processed
    Then the system returns an error message
    And the error message is formatted as { 'errorCode': 'INVALID_IDENTIFIER', 'description': 'The provided identifier is invalid.' }

  Scenario: Non-existent Gateway ID for Status Retrieval
    Given a user supplies a gateway ID that does not exist in the system
    When the request to retrieve the gateway status is processed
    Then the system returns an error message
    And the error message is formatted as { 'errorCode': 'RESOURCE_NOT_FOUND', 'description': 'The gateway ID provided does not exist.' }

  Scenario: Incorrect Format for Creating a Gateway
    Given a user attempts to create a gateway with missing or improperly formatted parameters
    When the creation request is processed
    Then the system validates the input and returns an error
    And the error message is formatted as { 'errorCode': 'INVALID_PARAMETERS', 'description': 'Please ensure all parameters meet the required formats.' }

  Scenario: Listing Gateways with Valid Input
    Given the user has valid identifiers
    When the user requests to list the gateways
    Then the system returns a consistent response structure
    And the response contains fields for 'gatewayId', 'gatewayName', and 'status'

  Scenario: Gateway Status Retrieval with Valid Input
    Given the user supplies a valid gateway ID
    When the request to retrieve the gateway status is processed
    Then the system returns the gateway status
    And the response contains fields for 'gatewayId', 'gatewayName', and 'status'

  Scenario: Handling Invalid Gateway ID While Listing
    Given a user attempts to list gateways with a non-existent gateway ID
    When the request to list the gateways is processed
    Then the system returns an error message
    And the error message is formatted as { 'errorCode': 'INVALID_IDENTIFIER', 'description': 'The provided identifier is invalid.' }
