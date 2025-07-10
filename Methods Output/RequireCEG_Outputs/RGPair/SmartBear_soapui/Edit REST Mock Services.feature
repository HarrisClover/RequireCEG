Feature: Edit REST Mock Services

  As a user of the REST Mock Service
  I want to efficiently manage and modify mock responses
  So that I can ensure my API testing scenarios are accurate and reliable

  Background:
    Given the user has access to the REST Mock Service
    And the user is logged in

  Scenario: Scenario 1: Editing an existing mock response in SEQUENCE mode
    Given the user selects a REST Mock Service for editing
    And the user chooses SEQUENCE mode for modifying mock responses
    When the user modifies the existing mock response
    Then the modified response should be reflected in the mock service
    And the system should save the changes automatically

  Scenario: Scenario 2: Adding a new resource to the mock service
    Given the user decides to add a new resource
    When the user specifies the resource URL and selects an HTTP method
    Then the new resource should be created successfully
    And the system should enforce the requirement to specify a resource URL

  Scenario: Scenario 3: Confirming the deletion of a mock resource
    Given the user attempts to delete a mock resource
    When the system prompts the user to confirm deletion
    Then the user can confirm or cancel the deletion

  Scenario: Scenario 4: Handling token expiration
    Given the token expiration is monitored
    When the tokens are about to expire
    Then the system should automatically refresh the tokens

  Scenario Outline: Scenario Outline: Updating parameters at the request level
    Given the user updates the parameters at the request level to <parameter>
    And the resource has <resource> associated
    When the user saves the changes
    Then all changes should propagate to <method> level
    Examples:
      | parameter | resource | method |
      | query | GET Resource | GET |
      | body | POST Resource | POST |
      | header | DELETE Resource | DELETE |

