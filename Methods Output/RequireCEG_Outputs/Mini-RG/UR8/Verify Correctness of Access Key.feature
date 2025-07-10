Feature: Verify Correctness of Access Key

  As a user
  I want to verify the validity of access keys for the API
  So that I can ensure secure access to the system

  Background:
    Given the access type is set to 'free'
    And an access key is provided

  Scenario: Scenario 1: Key has expired
    Given a valid access key that has expired
    When the user attempts to access the API
    Then the system should return 'Access Denied: Key has expired'
    And the access key must not be valid

  Scenario: Scenario 2: Key is invalid
    Given an access key that does not exist
    When the user attempts to access the API
    Then the system should return 'Access Denied: Invalid Key'
    And the access key must not be valid

  Scenario: Scenario 3: Insufficient permissions
    Given a valid access key without the required permissions
    When the user attempts to access the API
    Then the system should return 'Access Denied: Insufficient Permissions'
    And the access key lacks the necessary permissions

  Scenario: Scenario 4: Valid access key
    Given a valid access key with the required permissions
    When the user attempts to access the API
    Then the system should grant access to the API

  Scenario: Scenario 5: Invalid key and key has expired
    Given an access key that is both invalid and has expired
    When the user attempts to access the API
    Then the system should return 'Access Denied: Invalid Key'
    And both conditions leading to denial occur

  Scenario Outline: Scenario Outline: Verify Access Key Scenarios
    Given the access type is '<access-type>'
    And the access key is '<access-key>'
    When the user tries to access the API
    Then the system should return '<expected-outcome>'
    Examples:
      | access-type | access-key | expected-outcome |
      | free | N/A | Grants access |
      | provided | valid-expired-key | Access Denied: Key has expired |
      | provided | invalid-key | Access Denied: Invalid Key |
      | provided | valid-no-permission | Access Denied: Insufficient Permissions |
      | provided | valid-with-permission | Grants access |

