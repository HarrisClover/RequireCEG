Feature: Error Handling for SNS API Calls

  As a user of the SNS API
  I want to receive clear error messages for various invalid inputs or issues
  So that I can understand and correct my requests to the SNS system

  Background:
    Given the user is authenticated and ready to issue API calls
    And the SNS system is operational and accessible

  Scenario: Scenario 1: List topics successfully
    Given a valid request to list SNS topics
    When the user issues the API call
    Then the system returns a list of available SNS topics
    And the response code is 200

  Scenario: Scenario 2: Non-existent topic name
    Given the user inputs a non-existent topic name
    When the user issues the API call
    Then the system returns an error code 404
    And the response includes a message stating that the requested topic does not exist

  Scenario: Scenario 3: Invalid parameters or malformed request
    Given the user provides incorrect parameters in the request
    When the user issues the API call
    Then the system returns an error code 400
    And the response includes details about the invalid input

  Scenario: Scenario 4: Invalid SNS identifier
    Given the user provides an invalid SNS identifier
    When the user issues the API call
    Then the system responds with an error message
    And the message indicates the issue with the provided identifier

  Scenario: Scenario 5: Service unavailability
    Given the SNS service is temporarily unavailable
    When the user issues the API call
    Then the system returns an error code 503
    And the response recommends that the user retry the action at a later time

  Scenario: Scenario 6: Successful listing with all valid conditions
    Given the user provides a valid input for listing SNS topics
    And the user does not provide a non-existent topic name
    And the user does not provide incorrect parameters or malformed request syntax
    And the user does not utilize an invalid SNS identifier
    And the request to list topics is not unsuccessful due to service unavailability
    When the user issues the API call
    Then the system returns a list of available SNS topics
    And the response code is 200
