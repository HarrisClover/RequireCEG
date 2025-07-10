Feature: Authenticate with API Access Key

  As a user
  I want to access the API securely using an access key
  So that I can utilize the API functionalities with proper access control

  Background:
    Given the user attempts to access the API
    And the system determines the access type

  Scenario: Scenario 1: Access API without key
    Given the API access is free
    When the user tries to access the API
    Then the system grants access to the API functions

  Scenario: Scenario 2: Invalid access key
    Given the user provides an invalid API access key
    When the user tries to access the API
    Then the system displays an error message indicating that the access key is invalid

  Scenario: Scenario 3: Expired access key
    Given the user provides an expired API access key
    When the user tries to access the API
    Then the system presents an error message indicating that the access key has expired

  Scenario: Scenario 4: Valid key with insufficient permissions
    Given the user provides a valid API access key without the necessary permissions
    When the user tries to access the API
    Then the system displays an error message regarding lack of permissions

  Scenario: Scenario 5: Valid key with correct permissions
    Given the user provides a valid API access key that is not expired and has the necessary permissions
    When the user tries to access the API
    Then the system allows access to the API functions

  Scenario: Scenario 6: API access key with multiple invalid conditions
    Given the user provides an expired API access key that lacks necessary permissions
    When the user tries to access the API
    Then the system displays an error message indicating that the access key has expired
    And the system displays an error message regarding lack of permissions
