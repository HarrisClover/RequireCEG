Feature: Delete SOAP Mock Services

  As a system user
  I want to delete selected SOAP mock services
  So that I can manage the services effectively and keep the system organized

  Background:
    Given a user is logged into the system
    And there are existing SOAP mock services available

  Scenario: Scenario 1: Confirm deletion of a SOAP mock service
    Given a user selects a SOAP mock service for deletion
    When the system presents a confirmation dialog with the message 'Are you sure you want to delete the selected SOAP mock service?'
    Then the user selects 'Yes'
    And the system deletes the selected SOAP mock service from the database
    And the system displays a success message stating 'SOAP mock service deleted successfully.'
    And the user interface is updated to reflect the removal of the service from the list
    And the system logs the deletion action with the details of the service removed

  Scenario: Scenario 2: Cancel deletion of a SOAP mock service
    Given a user selects a SOAP mock service for deletion
    When the system presents a confirmation dialog with the message 'Are you sure you want to delete the selected SOAP mock service?'
    Then the user selects 'No'
    And the system takes no action and maintains the service intact

  Scenario: Scenario 3: Error during deletion of SOAP mock service
    Given a user selects a SOAP mock service for deletion
    When the system attempts to delete the selected SOAP mock service but encounters an error
    Then the system generates an error message stating 'Error: Deletion of the SOAP mock service failed.'
    And the error details are logged for further investigation

  Scenario: Scenario 4: Deletion confirmation not received
    Given a user selects a SOAP mock service for deletion
    When the system presents a confirmation dialog with the message 'Are you sure you want to delete the selected SOAP mock service?'
    Then the user does not confirm the deletion
    And the system does not delete the service
