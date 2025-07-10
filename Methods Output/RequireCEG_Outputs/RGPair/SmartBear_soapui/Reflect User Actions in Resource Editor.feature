Feature: Reflect User Actions in Resource Editor

  As a user of the mock service editor
  I want to dynamically respond to interactions with mock responses
  So that I can edit and manage mocks seamlessly without inconsistencies

  Background:
    Given the user is logged into the mock service editor
    And the user has selected a specific REST mock service

  Scenario: Scenario 1: Viewing Available Mock Responses
    Given the user has selected a REST service
    When the editor retrieves all available mock responses for that service
    Then the user should see a list of mock responses
    And the user should be able to select a mock response for editing

  Scenario: Scenario 2: Editing a Mock Response
    Given the user is editing a selected mock response
    When the user modifies details of the mock response
    Then the changes should be instantly visible in all connected components
    And the request view and top URI bar should reflect the updated response

  Scenario: Scenario 3: Adding a New Mock Resource
    Given the user decides to add a new mock resource
    When the new resource is created
    Then the system should synchronize all related parameters across the request, method, and resource levels

  Scenario: Scenario 4: Deleting a Mock Resource
    Given the user decides to delete a mock resource
    When the resource is deleted
    Then the system should clear all references to that resource in the editor
    And there should not be any outdated information persisted

  Scenario: Scenario 5: Adjusting OAuth 2.0 Profiles
    Given the user adjusts OAuth 2.0 profiles
    When the new token configurations are applied
    Then the request setup should automatically update to reflect the new token configurations
    And token expiration should be managed seamlessly without user disruption

  Scenario: Scenario 6: Managing Dynamic Properties
    Given dynamic properties are established within the resource editor
    When the user modifies these properties
    Then the system should reflect accurate values throughout all user interfaces

  Scenario Outline: Scenario Outline: Specific Dynamic Properties Management
    Given dynamic properties are established within the resource editor
    And there is a specific property <Property> with initial value <Initial Value>
    When the user changes the property to <New Value>
    Then the system should log <Property> interactions with the new value <New Value>
    Examples:
      | Property | Initial Value | New Value |
      | Header A | Value 1 | Value 2 |
      | Header B | Value 3 | Value 4 |
      | Header C | Value 5 | Value 6 |

