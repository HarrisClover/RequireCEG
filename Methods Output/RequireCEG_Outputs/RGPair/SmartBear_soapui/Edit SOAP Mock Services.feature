Feature: Edit SOAP Mock Services

  As a user who manages SOAP Mock services
  I want to edit existing SOAP Mock services to update configurations
  So that I can ensure the services are functioning correctly and meet required standards

  Background:
    Given the user is logged into the application
    And the list of available SOAP Mock services is displayed

  Scenario: Scenario 1: Edit existing SOAP Mock service
    Given the user selects a service to edit
    And the current service configurations are retrieved successfully
    When the user modifies the service parameters
    Then real-time validation checks inputs against SOAP standards
    And if the endpoint URL is invalid, an error message is displayed next to the endpoint URL field

  Scenario: Scenario 2: Save valid configurations
    Given the user has made changes to the service configurations
    When the user initiates the save process
    Then if the configurations are valid, a success notification is displayed confirming the successful save

  Scenario: Scenario 3: Prevent saving invalid configurations
    Given the user has invalid configurations in the service form
    When the user attempts to save the configurations
    Then the application prevents the save action
    And specific error messages are shown detailing the necessary corrections for endpoint URL, request structure, response structure, and authentication settings

  Scenario: Scenario 4: Delete a specific response
    Given the user wishes to delete a response from the SOAP Mock service
    When the user clicks the delete button next to the response
    Then a confirmation modal appears asking for confirmation
    And upon confirming, the response is permanently removed from the service configuration

  Scenario: Scenario 5: Automatically refresh service list after successful edits
    Given the user has successfully edited the service
    When the changes are saved
    Then the service list automatically refreshes to reflect changes made

  Scenario: Scenario 6: Real-time validation of inputs
    Given the user is editing the service configurations
    When the endpoint URL is entered as 'http://example.com'
    Then the validation result for the endpoint URL should be 'valid'
    And the response structure is entered as '<invalid XML>'
    Then the validation result for the response structure should be 'invalid'
