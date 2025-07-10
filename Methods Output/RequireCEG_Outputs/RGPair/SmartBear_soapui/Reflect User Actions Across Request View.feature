Feature: Reflect User Actions Across Request View

  As a user
  I want the system to display my modifications in real-time across all views
  So that I can maintain consistency and accuracy in my interactions with the system

  Background:
    Given the system is initialized
    And the user is logged in

  Scenario: Scenario 1: Modify HTTP Method
    Given the user sets the HTTP method to POST
    And the request body is opened
    When the user modifies the request body
    Then only appropriate body content must be permitted
    And an error message is displayed for invalid content

  Scenario: Scenario 2: Adding Query Parameters
    Given the request view is open
    When the user adds a query parameter
    Then the parameter is displayed in the request view
    And the added query parameter must also be reflected in the resource editor synchronously

  Scenario: Scenario 3: Deleting Parameters
    Given the user deletes a parameter from the request view
    Then the parameter is removed from the request view
    And the deleted parameter must also be removed from all other views

  Scenario: Scenario 4: OAuth 2.0 Token Refresh
    Given the user has configured an OAuth 2.0 profile
    When the access token is near expiration
    Then the system automatically refreshes the access token
    And the updated token status is displayed in all views in real-time

  Scenario: Scenario 5: Modifying Dynamic Properties
    Given the response configuration has dynamic properties
    When the user interacts with a dynamic property
    Then the changes are immediately reflected in the request view

  Scenario Outline: Scenario Outline: Dynamic Property Interaction
    Given the response configuration has dynamic properties
    When the user interacts with a dynamic property
    Then the changes are immediately reflected in the request view
    Examples:
      | Dynamic Property | Change Type | Outcome |
      | Property A | Update | Property A updated in request view |
      | Property B | Remove | Property B removed from request view |
      | Property C | Add | Property C added to request view |

