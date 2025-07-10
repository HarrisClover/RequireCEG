Feature: OAuth 2.0 Integration
  As a user,
  I want to configure and use OAuth 2.0 for securing requests to tested services,
  So that I can accurately simulate real-world authentication scenarios.

  Scenario: Create an OAuth 2.0 Profile
    Given the user is in the OAuth 2.0 configuration section
    When the user creates a new OAuth 2.0 profile named "MyClientCredentials"
    And configures it with grant type "Client Credentials", access token URL, client ID, and client secret
    And saves the profile
    Then the "MyClientCredentials" profile should be available for use
    And the creation event should be logged

  Scenario: Apply an OAuth 2.0 profile to a request
    Given an existing OAuth 2.0 profile "MyClientCredentials"
    And the user is viewing a request editor for an external API call (not a mock service itself)
    When the user selects the "MyClientCredentials" profile in the Authorization settings for the request
    Then the request authorization should be configured to use OAuth 2.0 with the selected profile

  Scenario: Send request using OAuth 2.0 profile and verify token application
    Given a request is configured to use the "MyClientCredentials" OAuth 2.0 profile
    And the application can successfully retrieve a token using the profile details
    When the user sends the request
    Then the outgoing HTTP request should include an "Authorization: Bearer <access_token>" header
    And the token retrieval and application should be logged

  Scenario: Automatic token refresh on expiry
    Given a request is configured to use an OAuth 2.0 profile "MyAuthorizationCode" (which provides refresh tokens)
    And the current access token associated with the profile is expired or nearing expiry
    When the user sends the request
    Then the application should automatically attempt to refresh the access token using the refresh token
    And if successful, the outgoing HTTP request should include an "Authorization: Bearer <new_access_token>" header
    And the refresh event should be logged