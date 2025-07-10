Feature: Transaction History Access Control
  As a system user,
  I want my ability to view and record transaction history controlled by my permissions,
  So that data access is secure and appropriate for my role.

  Background:
    Given a user is logged into the system

  Scenario: User with full permissions can view and record history
    Given the user has permission to "View Transaction History"
    And the user has permission to "Keep Transaction History Record"
    When the user attempts to view the transaction history
    Then the transaction history should be displayed
    And the user should have the option to keep a record
    When the user chooses to keep a record of the transaction history
    Then the transaction history record should be successfully kept

  Scenario: User with view-only permission can view but not record history
    Given the user has permission to "View Transaction History"
    And the user does not have permission to "Keep Transaction History Record"
    When the user attempts to view the transaction history
    Then the transaction history should be displayed
    And the user should not have the option to keep a record
    # Optional: Add a step to verify attempting to record fails if the UI somehow allows it
    # When the user attempts to keep a record of the transaction history
    # Then the action should be denied or an error message "Permission Denied" should be shown

  Scenario: User without view permission cannot access history
    Given the user does not have permission to "View Transaction History"
    # The permission to keep record is irrelevant if viewing is denied
    # And the user may or may not have permission to "Keep Transaction History Record"
    When the user attempts to view the transaction history
    Then access should be denied
    And the transaction history should not be displayed
    And the user should not have the option to keep a record