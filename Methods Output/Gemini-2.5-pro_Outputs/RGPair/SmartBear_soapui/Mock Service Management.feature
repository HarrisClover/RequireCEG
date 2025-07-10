Feature: Mock Service Management
  As a user,
  I want to create, edit, and delete REST and SOAP Mock Services and their components,
  So that I can effectively manage my mock testing environment.

  Scenario: Create a new REST Mock Service
    Given the user is logged into the application
    When the user initiates the creation of a new REST Mock Service
    And provides a name "Example REST Service" and configuration details
    And confirms the creation
    Then a new REST Mock Service named "Example REST Service" should be listed
    And the creation event should be logged

  Scenario: Create a new SOAP Mock Service
    Given the user is logged into the application
    When the user initiates the creation of a new SOAP Mock Service
    And provides a name "Example SOAP Service" and configuration details (e.g., WSDL source)
    And confirms the creation
    Then a new SOAP Mock Service named "Example SOAP Service" should be listed
    And the creation event should be logged

  Scenario: Add a resource to a REST Mock Service
    Given an existing REST Mock Service "Example REST Service"
    When the user adds a new resource with path "/users/{userId}"
    Then the resource "/users/{userId}" should be listed under "Example REST Service"
    And the addition should be logged

  Scenario: Add a mock response to a REST resource/method
    Given an existing REST Mock Service "Example REST Service" with resource "/users/{userId}" and method "GET"
    When the user adds a new mock response for the "GET" method
    And configures the response status code to "200" and body to '{"id": "{userId}", "name": "Mock User"}'
    Then the new mock response should be associated with "GET /users/{userId}"
    And the addition should be logged

  Scenario: Edit an existing mock response
    Given an existing mock response for "GET /users/{userId}" in "Example REST Service"
    When the user edits the response body to '{"id": "{userId}", "name": "Updated Mock User"}'
    And saves the changes
    Then the mock response for "GET /users/{userId}" should reflect the updated body
    And the revision should be logged

  Scenario: Delete a mock response
    Given an existing mock response for "GET /users/{userId}" in "Example REST Service"
    When the user deletes the mock response
    Then the response should no longer be associated with "GET /users/{userId}"
    And the deletion should be logged

  Scenario: Delete a mock resource
    Given an existing REST Mock Service "Example REST Service" with resource "/users/{userId}"
    When the user deletes the resource "/users/{userId}"
    Then the resource "/users/{userId}" should no longer be listed under "Example REST Service"
    And the deletion should be logged

  Scenario: Delete a Mock Service
    Given an existing REST Mock Service "Example REST Service"
    When the user deletes the "Example REST Service"
    Then the "Example REST Service" should no longer be listed
    And the deletion should be logged