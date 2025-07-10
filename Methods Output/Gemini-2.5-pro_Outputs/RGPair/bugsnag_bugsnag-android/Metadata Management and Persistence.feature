Feature: Metadata Management and Persistence
  As a developer,
  I want error reports to contain relevant, persistent, and customizable metadata
  So that I have sufficient context to debug issues across sessions and configurations.

  Scenario: Standard Metadata Inclusion
    Given the error reporting system is initialized
    When any error or crash occurs
    Then the report payload should contain standard device metadata (e.g., osVersion, manufacturer, model)
    And the report payload should contain standard app metadata (e.g., appVersion, versionCode, releaseStage)

  Scenario: User and Device Data Persistence
    Given the error reporting system is initialized
    And user information (ID "persistUser", email "persist@example.com", name "Persistent User") is set
    And the application is closed and reopened
    When an error occurs in the new session
    Then the error report payload should contain the persisted user information:
      | field      | value           |
      | user.id    | persistUser     |
      | user.email | persist@example.com |
      | user.name  | Persistent User |

  Scenario: Adding Custom Metadata via Plugin/Callback
    Given the error reporting system is initialized with a plugin/callback
    And the plugin/callback is configured to add custom metadata key "account_type" with value "premium"
    When an error occurs
    Then the report payload should contain the custom metadata:
      | section | key          | value   |
      | metaData| custom_tab   | account_type: premium | # Assuming plugin adds to a 'custom_tab'

  Scenario: Filtering Sensitive Metadata
    Given the error reporting system is initialized
    And configured to filter metadata keys containing "password"
    And custom metadata "user_details" with value "{ 'username': 'test', 'password': 'secret' }" is added before sending
    When an error occurs
    Then the report payload metadata should contain "user_details"
    But the value associated with "password" should be filtered/redacted (e.g., "[FILTERED]")

  Scenario: Handling Unusual Strings in Metadata
    Given the error reporting system is initialized
    And user name is set to "User ✨ Test 🚀 Long Name With Symbols %$^*()"
    And custom metadata "weird_data" is set to "{\"key\": \"\uD83D\uDCA9\u0000\"}" # Example with emoji and null char
    When an error occurs
    Then the error report should be sent successfully
    And the report payload should contain the user name (potentially sanitized/truncated if necessary by the backend)
    And the report payload should contain the "weird_data" metadata (potentially sanitized)

