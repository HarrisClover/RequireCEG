Feature: Delete REST Mock Services

  As a user managing REST Mock services
  I want to delete selected REST Mock services
  So that I can manage my services efficiently and keep the system organized

  Background:
    Given that a user is on the Mock Services management page
    And a REST Mock service is selected for deletion

  Scenario: Confirming deletion of a REST Mock service in use
    Given that the selected REST Mock service is currently in use by another resource
    When the user confirms the deletion
    Then the system displays a warning message stating 'This REST Mock service cannot be deleted while it is in use.'
    And the deletion action is logged for audit purposes.

  Scenario: Successfully deleting a REST Mock service not in use
    Given that the selected REST Mock service is not in use
    When the user confirms the deletion
    Then the system permanently removes the selected REST Mock service
    And logs the deletion action for audit purposes
    And notifies the user with the message 'The selected REST Mock service has been successfully deleted.'

  Scenario: Cancelling deletion of a REST Mock service
    Given that a user has selected a REST Mock service for deletion
    When the user cancels the deletion
    Then the selected REST Mock service remains intact
    And the system does not log any deletion attempt.

  Scenario: Attempting to delete a REST Mock service
    Given that a user has selected a REST Mock service for deletion
    When the user decides to delete the service
    Then the system displays a confirmation prompt asking the user to confirm or cancel the deletion.
