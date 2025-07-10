Feature: Support for Variable HTTP Methods

  As a system user
  I want to perform various operations using HTTP methods
  So that I can interact flexibly with the application's resources

  Background:
    Given the system supports HTTP methods 'GET', 'POST', 'PUT', and 'DELETE'
    And each method has specific behaviors and requirements

  Scenario: Scenario 1: GET Method with Query Parameters
    Given a user selects 'GET' method
    And the user inputs valid query parameters
    When the request is submitted
    Then the system returns the corresponding mock response for 'GET'
    And the interaction is logged for traceability and transparency

  Scenario: Scenario 2: POST Method with Request Body
    Given a user selects 'POST' method
    When the user submits a request body with all required fields
    Then the system processes the data according to predefined mock behaviors for 'POST'
    And the interaction is logged for transparency

  Scenario: Scenario 3: POST Method Missing Required Fields
    Given a user selects 'POST' method
    When the user submits a request body missing required fields
    Then the system displays an error message for missing required fields for 'POST'

  Scenario: Scenario 4: PUT Method for Updating Resources
    Given a user selects 'PUT' method
    When the user submits an update request with all required fields
    Then the system updates existing mock resources with the received data for 'PUT'
    And the interaction is logged for traceability

  Scenario: Scenario 5: PUT Method Missing Fields
    Given a user selects 'PUT' method
    When the user submits an update request missing required fields
    Then the system displays an error message for missing required fields for 'PUT'

  Scenario: Scenario 6: DELETE Method for Resource Removal
    Given a user selects 'DELETE' method
    And the user specifies the resource to be removed
    When the request is submitted
    Then the system confirms the deletion of the specified resource for 'DELETE'
    And the system logs the method chosen, parameters provided, and results of the operation

  Scenario: Scenario 7: Logging Interactions
    Given any interaction occurs with the system
    When a user performs any HTTP operation
    Then the system logs the method chosen, parameters provided, and results of the operation

  Scenario: Scenario 8: Confirming Existence of Resource
    Given a user selects 'DELETE' method
    And the resource specified exists
    When the user submits a request to delete the resource
    Then the system verifies the deletion

  Scenario: Scenario 9: Resource Non-Existence Error
    Given a user selects 'DELETE' method
    And the resource specified does not exist
    When the request is submitted
    Then the system displays an error message if the resource does not exist for 'DELETE'
