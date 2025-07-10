Feature: Apply OAuth Tokens in Requests

  As a user of the application
  I want the application to manage OAuth 2.0 access tokens automatically
  So that I can make requests without manual token management

  Background:
    Given the user has set up an OAuth 2.0 profile
    And the access token is stored securely

  Scenario: Check and Retrieve Access Token
    Given the user is logged into the application
    When the application prepares to make an API request
    Then the application should check for a valid access token
    And retrieve the access token if it exists

  Scenario: Handle Expired Access Token
    Given the access token is found to be expired
    When the application tries to make a request
    Then the application should initiate a token refresh process

  Scenario: Send HTTP Request with Valid Access Token
    Given the access token is valid and ready to use
    And the user specifies the HTTP method as GET, POST, PUT, or DELETE
    When the application sends a request to the API
    Then the request should include the access token in the appropriate headers according to the specified HTTP method

  Scenario: Confirm Success after Token Application
    Given the request was successfully sent
    When the API responds
    Then the application should display a confirmation message indicating the status of the token application

  Scenario: Log Errors during Token Retrieval
    Given an error occurs during access token retrieval
    When the application cannot obtain a valid token
    Then the system should log detailed error information
    And present a relevant error message to the user

  Scenario: Token Refresh Error Handling
    Given the access token is expired
    And an error occurs during the token refresh process
    When the application cannot successfully obtain a new access token
    Then the system should present a relevant error message to the user

  Scenario Outline: HTTP Request with Access Token
    Given the access token is valid and ready to use
    And the user specifies the HTTP method as <method>
    When the application sends a request to the API
    Then the request should include the access token in the appropriate headers
    Examples:
      | method | request-url | headers |
      | GET | /api/resource | Authorization: Bearer <token> |
      | POST | /api/resource | Authorization: Bearer <token> |
      | PUT | /api/resource | Authorization: Bearer <token> |
      | DELETE | /api/resource | Authorization: Bearer <token> |

