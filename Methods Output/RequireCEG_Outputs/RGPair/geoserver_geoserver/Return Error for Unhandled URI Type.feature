Feature: Return Error for Unhandled URI Type

  As a user
  I want to receive clear error messages when using unsupported URI types
  So that I can understand why my repository management actions failed

  Background:
    Given the user is authenticated
    And the user has the necessary permissions

  Scenario: Scenario 1: Importing with an unsupported URI type
    Given the user attempts to import a repository with an unsupported URI type
    When the system processes the request
    Then the system should return a 400 Bad Request status code
    And the response should be a JSON object with: {"error": "Unsupported URI type.", "message": "The URI type provided is not handled by the system."}

  Scenario: Scenario 2: Importing with disabled URI handlers
    Given the user attempts to import a repository with a valid URI type but handlers are disabled
    When the system processes the request
    Then the system should return a 400 Bad Request status code
    And the response should indicate that the URI type cannot be processed due to disabled handlers

  Scenario: Scenario 3: Performing repository actions with unrecognized URI type
    Given the user attempts to create a repository using an unrecognized URI type
    When the system processes the request
    Then the system should return a 400 Bad Request status code
    And the response should be a JSON object with: {"error": "Unsupported URI type.", "message": "The URI type provided is not handled by the system."}

  Scenario: Scenario 4: Performing management action with unsupported URI type
    Given the user attempts to delete a repository using an unsupported URI type
    When the system processes the request
    Then the system should return a 400 Bad Request status code
    And the response should be a JSON object with: {"error": "Unsupported URI type.", "message": "The URI type provided is not handled by the system."}

  Scenario Outline: Scenario Outline: Repository management actions with unrecognized URI type
    Given the user attempts to <action> a repository using an unrecognized URI type '<uri>'
    When the system processes the request
    Then the system should return a 400 Bad Request status code
    And the response should be a JSON object with: {"error": "Unsupported URI type.", "message": "The URI type provided is not handled by the system."}
    Examples:
      | action | uri |
      | create | ftp://example.com/repo |
      | import | xyz://example.com/repo |
      | delete | unsupported://repo |

