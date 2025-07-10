Feature: Unsupported Repository Operations via REST API
  As an API Client
  I need to know when I attempt an operation not supported by the plugin's REST API
  So that I understand the API's limitations.

  Scenario: Attempt to perform an unsupported operation (e.g., Rename)
    Given a repository named "my-repo" exists
    When I send a request to an unsupported endpoint or use an unsupported method (e.g., PUT/PATCH) to rename "my-repo"
    Then the response status should be 400 Bad Request
    And the response body should indicate that the command "is not available through the plugin" or "operation not supported"