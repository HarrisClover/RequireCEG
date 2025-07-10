Feature: Design Robust User Interface for Managing Mock Services

  As a user of the mock services management dashboard
  I want to create and manage REST mock services seamlessly
  So that I can effectively simulate API responses and manage my testing workflow

  Background:
    Given the user is logged into the mock services management dashboard
    And the user has existing mock services available to manage

  Scenario: Scenario 1: Create a new mock service
    Given the user opts to create a new mock service
    When the user fills in the service details including URL, request method, and response format
    Then the new mock service should be successfully created
    And the system presents an intuitive form for new mock service creation.

  Scenario: Scenario 2: Edit an existing mock service
    Given the user selects an existing mock service to edit
    When the service details are preloaded in the form for modification
    Then the user can change the service details and save the changes
    And the system preloads current details for editing an existing mock service.

  Scenario: Scenario 3: Delete a mock service
    Given the user attempts to delete a mock service
    When the user confirms the deletion in the confirmation dialog
    Then the mock service should be deleted
    And the user should be notified of the successful deletion
    And the system prompts a confirmation dialog for deletion.

  Scenario: Scenario 4: Implement OAuth 2.0 settings
    Given the user wants to configure OAuth 2.0 settings for a mock service
    When the user selects the OAuth 2.0 options and adds token profiles
    Then the OAuth 2.0 settings should be saved successfully
    And the system provides options for setting OAuth 2.0 profiles and tokens.

  Scenario: Scenario 5: View dynamic properties in responses
    Given the user is editing a response that includes dynamic properties
    When the user expands the dynamic properties section
    Then the user should see real-time previews of how responses behave with varying inputs
    And the system makes dynamic response properties expandable in the editor.

  Scenario Outline: Scenario Outline: Add a mock response to a mock service
    Given the user is viewing a specific mock service
    When the user adds a new mock response with status code <status-code>, headers <headers>, and body <body>
    Then the new mock response should be successfully added to the mock service
    Examples:
      | status-code | headers | body |
      | 200 | { 'Content-Type': 'application/json' } | { 'key': 'value' } |
      | 404 | { 'Content-Type': 'text/html' } | { 'error': 'Not Found' } |
      | 500 | { 'Content-Type': 'application/json' } | { 'error': 'Internal Server Error' } |

