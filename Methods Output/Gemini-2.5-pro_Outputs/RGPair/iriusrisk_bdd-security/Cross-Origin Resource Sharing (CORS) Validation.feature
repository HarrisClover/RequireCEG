Feature: Cross-Origin Resource Sharing (CORS) Validation
  As a Security Team,
  I want CORS requests to be strictly validated
  So that only explicitly allowed origins can interact with the application's APIs.

  Scenario Outline: Validate Cross-Origin Requests
    Given the application exposes an API endpoint <api_endpoint>
    And the application is configured to allow requests only from specific origins
    When a browser makes a request to <api_endpoint> from origin <request_origin>
    Then the server response should <access_result> the request based on the CORS policy

    Examples:
      | api_endpoint    | request_origin          | access_result   |
      | /api/v1/data    | https://trusted.example.com | allow           |
      | /api/v1/data    | https://untrusted.com   | deny / not allow|
      | /api/v1/config  | https://admin.example.com | allow           |
      | /api/v1/config  | https://trusted.example.com | deny / not allow| # Assuming different permissions