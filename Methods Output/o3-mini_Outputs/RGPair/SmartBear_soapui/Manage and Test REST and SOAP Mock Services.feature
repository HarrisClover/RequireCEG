Feature: Manage and Test REST and SOAP Mock Services
As a user of the application,
I want to create, edit, and manage both REST and SOAP mock services,
So that I can dispatch dynamic responses, handle authentication, and ensure seamless integration across the system layers.

@mock-service Scenario Outline: Create and manage mock services with synchronized parameters
Given the user is logged into the system
And the user navigates to the mock services management page
And a new "<service-type>" mock service is selected for creation
When the user sets the dispatch mode to "<dispatch-method>" for the service
And populates the resource, method, and request level parameters
Then the system should synchronize the parameters across all levels
And the mock service should be created successfully
Examples:
  | service-type | dispatch-method |
  | REST         | SEQUENCE        |
  | REST         | SCRIPT          |
  | SOAP         | SEQUENCE        |
  | SOAP         | SCRIPT          |
@oauth Scenario: Automatic refresh of OAuth 2.0 tokens
Given the user has configured an OAuth 2.0 profile with valid credentials
And an access token has been applied in a request
When the access token expires
Then the system should automatically refresh the access token
And the new token must be applied to subsequent requests

@dynamic-properties Scenario: Handling dynamic properties and expansion in requests
Given the user is preparing a mock request that includes dynamic query and matrix parameters
And the system supports dynamic property expansion
When the user dispatches the request
Then the system should correctly expand and handle all dynamic properties
And log detailed interaction information along with any errors if they occur

@http-methods Scenario: Updating mock services using various HTTP methods
Given the user selects an HTTP method (GET, POST, PUT, or DELETE) in the mock request editor
And updates the corresponding resource parameters via the user interface
When the changes are applied
Then the system must reflect these updates in the request view, resource editor, and top URI bar
And log the interactions and any errors accordingly

@resource-management Scenario: Deleting and revising mock resources and responses
Given the user is editing an existing mock service configuration
And the current mock resources and responses are displayed
When the user deletes or revises a particular resource or response
Then the system should remove or update the affected resource accordingly
And record a history log of the modifications for audit purposes