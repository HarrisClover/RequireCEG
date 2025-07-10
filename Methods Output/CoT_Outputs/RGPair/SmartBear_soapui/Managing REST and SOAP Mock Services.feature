Feature: Managing REST and SOAP Mock Services
  As a user of the system,
  I want to create, edit, and manage REST and SOAP Mock services
  So that I can simulate responses and test my application's interaction with various services.

  # Scenario 1: Create and Manage Mock Services
  Scenario Outline: User creates and manages mock services
    Given the user is logged into the system
    When the user creates or edits a mock service with the following details:
      | Service Type | HTTP Method | URI Path     | Response Code | Response Body |
      | <service-type> | <http-method> | <uri-path> | <response-code> | <response-body> |
    Then the mock service should be created or updated successfully
    And the service should be available for further editing and management

    Examples:
      | service-type | http-method | uri-path    | response-code | response-body  |
      | REST         | GET         | /api/data   | 200           | {"status":"OK"}|
      | SOAP         | POST        | /api/soap   | 202           | <response>...</response>|

  # Scenario 2: Syncing Parameters Across Mock Services
  Scenario: Syncing parameters across request, method, and resource levels
    Given the user has created a mock service
    When the user edits a parameter at the resource level
    Then the parameter should be synchronized across the request and method levels
    And the changes should be reflected in the system

  # Scenario 3: OAuth 2.0 Integration
  Scenario Outline: User configures OAuth 2.0 for mock service requests
    Given the user has logged into the system
    When the user sets up an OAuth 2.0 profile with the following details:
      | Profile Name | Client ID  | Client Secret | Token URL        |
      | <profile-name> | <client-id> | <client-secret> | <token-url> |
    Then the OAuth 2.0 profile should be saved successfully
    And the user can apply the OAuth token to mock service requests
    And the token should automatically refresh when expired

    Examples:
      | profile-name | client-id | client-secret | token-url       |
      | Default       | abc123    | secret123     | https://auth.com |

  # Scenario 4: Handling Dynamic Properties and HTTP Methods
  Scenario Outline: User configures dynamic properties and supports various HTTP methods
    Given the user is logged into the system
    When the user sets dynamic properties for a mock service
    And the user selects an HTTP method for the mock request
    Then the mock service should respond with the correct dynamic properties
    And the HTTP method should be supported for the request

    Examples:
      | dynamic-property | http-method |
      | user_id          | GET         |
      | session_id       | POST        |

  # Scenario 5: Robust User Interface and Error Logging
  Scenario: User manages mock services using the UI and logs errors
    Given the user is logged into the system
    When the user accesses the mock service management interface
    Then the interface should allow the user to create, edit, and delete mock services
    And the system should log all interactions and any errors encountered

  # Scenario 6: Accurate Query and Matrix Parameter Handling
  Scenario: Handling query and matrix parameters in mock services
    Given the user has created a mock service with query and matrix parameters
    When the user sends a request with specific query and matrix parameters
    Then the mock service should correctly handle and respond based on those parameters

  # Scenario 7: Ensuring Seamless Integration Across the Application
  Scenario: Reflecting changes across all layers of the application
    Given the user has made changes to the mock service configuration
    When the user navigates through the request view, resource editor, and URI bar
    Then the changes should be reflected correctly in all areas of the application
