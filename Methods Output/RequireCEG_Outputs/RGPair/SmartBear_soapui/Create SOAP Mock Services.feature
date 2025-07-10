Feature: Create SOAP Mock Services

  As a user
  I want to create, edit, and delete SOAP mock services
  So that I can manage mock services effectively for testing purposes

  Background:
    Given the user is logged into the application
    And the user navigates to the SOAP Mock Services section

  Scenario: Scenario 1: Creating a new SOAP mock service
    Given the user sees the option to create a new SOAP mock service
    When the user fills in the service name, WSDL URL, and response details and clicks 'Create'
    Then the system validates the fields
    And the new service is added to the user's list of active mock services
    And the system displays a success message confirming the creation

  Scenario: Scenario 2: Creating a new SOAP mock service with missing fields
    Given the user leaves one or more required fields empty
    When the user clicks 'Create'
    Then the system triggers an error message
    And the message specifies which fields need completion

  Scenario: Scenario 3: Editing an existing SOAP mock service
    Given the user selects an existing SOAP mock service
    When the user edits the service details and saves changes
    Then the system confirms that the modifications were saved

  Scenario: Scenario 4: Deleting a SOAP mock service
    Given the user selects a SOAP mock service to remove
    When the user confirms the deletion
    Then the system confirms the deletion of the SOAP mock service
    And the service is removed from the user's list

  Scenario: Scenario 5: Canceling the deletion of a SOAP mock service
    Given the user selects a SOAP mock service to remove
    When the user cancels the deletion
    Then the service remains in the user's list
    And the system cancels the deletion of the SOAP mock service

  Scenario Outline: Scenario Outline: Synchronizing parameters across sections
    Given the user has established parameters within a SOAP request
    And the parameters should synchronize with related sections
    When the user navigates to other sections of the application
    Then the parameters are consistently available across those sections
    Examples:
      | parameter | value |
      | Timeout | 30s |
      | Max Connections | 10 |
      | SOAP Action | getDetails |

