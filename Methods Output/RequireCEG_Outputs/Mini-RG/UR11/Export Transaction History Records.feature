Feature: Export Transaction History Records

  As a store manager
  I want to manage permissions for transaction history access
  So that I can ensure users have the appropriate access to view and export transaction history

  Background:
    Given the user is logged into the system
    And the user has specific permissions regarding transaction history

  Scenario: User with full access permission
    Given the user has full access to transaction history
    And the user has permission to keep a record
    When the user requests to export transaction history
    Then the system exports the entire transaction history
    And a confirmation message displays 'Your transaction history has been successfully exported.'

  Scenario: User with view-only access permission
    Given the user has view-only access to transaction history
    And the user does not have permission to keep a record
    When the user attempts to export transaction history
    Then the export option is disabled
    And the message displays 'You do not have permission to export your transaction history.'

  Scenario: User with no access permission
    Given the user has no access to transaction history
    When the user attempts to access transaction history
    Then an error message displays 'You do not have access to transaction history.'

  Scenario: User with view access permission only
    Given the user has view-only access to transaction history
    And the user does not have permission to keep a record
    When the user views their transaction history
    Then the transaction history is displayed on the screen
    And the message indicates 'You can view your transaction history.'

  Scenario: User with permission but no record keeping
    Given the user has permission to check transaction history
    And the user does not have permission to keep a record
    When the user seeks to export transaction history
    Then the export option is not available
    And the message displays 'You do not have permission to export your transaction history.'

  Scenario: User with permission to keep record and view
    Given the user has permission to check transaction history
    And the user has permission to keep a record
    When the user attempts to export transaction history
    Then the system exports the transaction history
    And a confirmation message displays 'Your transaction history has been successfully exported.'
