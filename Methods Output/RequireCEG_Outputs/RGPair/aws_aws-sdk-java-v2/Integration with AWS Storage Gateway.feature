Feature: Integration with AWS Storage Gateway

  As a system administrator
  I want to retrieve storage gateways from AWS Storage Gateway
  So that I can manage and monitor gateway resources effectively

  Background:
    Given the system is connected to the AWS environment
    And valid API credentials are in place

  Scenario: Scenario 1: Retrieve Existing Gateways Successfully
    Given the user requests the list of available storage gateways
    And the input parameters include a valid AWS region
    And the input parameters include a correctly formatted gateway ID
    When the system processes the request
    Then the system should return a valid list of storage gateways
    And the response should adhere to AWS Storage Gateway formatting

  Scenario: Scenario 2: Non-Existent Gateway ID
    Given the user inputs a non-existent gateway ID
    When the system processes the request
    Then the system should return an error code '404 Not Found'
    And the message should state 'The specified gateway ID does not exist.'

  Scenario: Scenario 3: Invalid Input Parameters
    Given the user inputs incorrect parameters such as an invalid AWS region
    And the input parameters do not include a correctly formatted gateway ID
    When the system processes the request
    Then the system should return an error indicating 'InvalidParameterValue'
    And the message should state 'The provided parameters are invalid for this request.'

  Scenario: Scenario 4: Permission Issues with IAM
    Given the user attempts to list the gateways without proper IAM permissions
    When the system processes the request
    Then the system should return an error code 'AccessDenied'
    And the message should articulate 'You do not have permission to access these resources.'

  Scenario: Scenario 5: Invalid Parameter Value
    Given the user inputs a valid AWS region
    And the user provides an incorrectly formatted gateway ID
    When the system processes the request
    Then the system should return an error indicating 'InvalidParameterValue'
    And the message should state 'The provided parameters are invalid for this request.'
