Feature: Create REST Mock Services with SCRIPT Responses

  As a developer
  I want to configure scripted responses for REST Mock Services
  So that I can test client applications effectively with consistent and synchronized mock data

  Background:
    Given the application allows the configuration of script content
    And the requests are made with appropriate method and resource levels

  Scenario: Create a REST Mock Service with a SCRIPT response
    Given a user selects the SCRIPT response type
    And the script content is configured to reflect specified parameters
    And the specified parameters are consistent across request, method, and resource levels
    When the mock service is created
    Then the service reflects the specified parameters in its responses
    And all references to parameters are updated automatically

  Scenario: Edit a REST Mock Service
    Given an existing mock service has been created
    When the user edits the mock service
    Then the application updates all references to parameters in the mock responses

  Scenario: Manage OAuth 2.0 Tokens
    Given a request includes headers requiring an OAuth 2.0 token
    When the user sets the OAuth profile
    Then the application applies the token to the request
    And automatically refreshes the token upon expiration

  Scenario: Log interactions with the mock service
    Given the mock service is being tested by the user
    When the user sends a request
    Then the interaction details are logged including the request sent and response received
    And any errors encountered are also logged

  Scenario: Handle query parameters in scripts
    Given the script contains query parameters
    When the application processes these parameters
    Then the parameters are decoded and managed properly

  Scenario: Check OAuth Token Management
    Given a token has expired
    When the application detects the expiration
    Then the token is refreshed automatically
    And the new token is applied to subsequent requests

  Scenario: Ensure all conditions meet for logging
    Given the user tests the mock service
    When the user sends multiple requests
    Then interaction details including request and response are logged accurately
    And Errors are captured if any occur
