Feature: Set OAuth 2.0 Profiles

  As a user managing OAuth profiles
  I want to input parameters required for setting an OAuth 2.0 profile
  So that I can authenticate my applications securely

  Background:
    Given the user is on the OAuth profile setup page
    And the required fields are displayed for input

  Scenario: Scenario 1: Successfully save OAuth profile
    Given the user has filled in all required fields including client ID, client secret, authorization URL, and token URL
    When the user submits the OAuth profile
    Then the profile should be saved in the system
    And a confirmation message 'Profile saved successfully' should be displayed

  Scenario: Scenario 2: Missing required fields
    Given the user has left some required fields empty such as client ID
    When the user attempts to submit the OAuth profile
    Then an error message 'Client ID is required' should indicate the missing fields

  Scenario: Scenario 3: Invalid credentials during token fetch
    Given the user has applied an OAuth profile to a request with invalid credentials
    When the user attempts to fetch access token
    Then an error message 'Invalid authorization credentials. Please check your client ID and secret.' should inform the user

  Scenario: Scenario 4: Token URL is missing
    Given the user has filled in authorization URL but left the token URL empty
    When the user submits the profile
    Then an error message 'Token URL is missing' should be displayed

  Scenario: Scenario 5: Client secret is missing
    Given the user has filled in client ID and authorization URL but left the client secret empty
    When the user submits the profile
    Then an error message 'Client secret is required' should be displayed

  Scenario Outline: Scenario Outline: Validate OAuth 2.0 Profile Submission
    Given the user inputs <client-id>
    And the user inputs <client-secret>
    And the user inputs <authorization-url>
    And the user inputs <token-url>
    When the user submits the profile
    Then the system should respond <response>
    Examples:
      | client-id | client-secret | authorization-url | token-url | response |
      | valid-id | valid-secret | https://auth.url | https://token.url | OAuth profile saved successfully |
      |  | valid-secret | https://auth.url | https://token.url | Client ID is required |
      | valid-id | invalid-secret | https://auth.url | https://token.url | Invalid authorization credentials. Please check your client ID and secret. |

