Feature: Managing REST and SOAP Mock Services
As a user,
I want to create, edit, and manage REST and SOAP mock services
So that I can test and manipulate parameters efficiently with mock responses

Scenario: Create a REST Mock Service
Given that I am logged into the system
And I want to create a REST mock service
When I add a new REST service with mock responses
Then the system should allow me to configure the service parameters
And I should be able to specify the HTTP method and response sequence
And I should be able to edit the request and response details as needed
And I should be able to set OAuth 2.0 profiles for the service
And I should be able to apply tokens to the requests with automatic refresh for expiration

Scenario: Create a SOAP Mock Service
Given that I am logged into the system
And I want to create a SOAP mock service
When I add a new SOAP service with mock responses
Then the system should allow me to configure the service parameters
And I should be able to specify the HTTP method and response sequence
And I should be able to edit the request and response details as needed
And I should be able to set OAuth 2.0 profiles for the service
And I should be able to apply tokens to the requests with automatic refresh for expiration

Scenario: Edit Mock Service Parameters
Given that I have created a mock service
When I edit the parameters of the mock service
Then the system should update the mock resources and responses
And the changes should reflect across request, method, and resource levels
And the system should handle dynamic properties through expansion

Scenario: Manage OAuth 2.0 Tokens
Given that I have created a mock service requiring OAuth 2.0 authentication
When I apply an OAuth token to a request
Then the system should allow token management including automatic refresh when expired
And the system should log all interactions related to OAuth tokens and their refreshes

Scenario: Handle Query and Matrix Parameters
Given that I am editing a mock service
When I add query and matrix parameters to a request
Then the system should handle them correctly
And the parameters should reflect in the request view, resource editor, and URI bar

Scenario: Logging and Error Handling
Given that I am using the mock service system
When I interact with the system
Then the system should log all relevant interactions and errors
And I should be able to view logs for debugging and testing purposes
