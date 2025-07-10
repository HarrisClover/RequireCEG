Feature: View Transaction History

  As a user with specific permissions
  I want to view and manage transaction history
  So that I can keep track of my transactions according to my permissions

  Background:
    Given the user has specific permission levels related to transaction history
    And the system is configured to respect those permissions

  Scenario: Scenario 1: User with permission to view and save transaction history
    Given the user has permission to check transaction history
    And the user has permission to keep a record
    When the user requests to view transaction history
    Then the transaction history is displayed
    And the user can save a copy of the transaction history

  Scenario: Scenario 2: User with permission to view but not save transaction history
    Given the user has permission to check transaction history
    And the user does not have permission to keep a record
    When the user requests to view transaction history
    Then the transaction history is displayed
    And the save functionality is disabled

  Scenario: Scenario 3: User without permission to view transaction history
    Given the user does not have permission to check transaction history
    When the user requests to view transaction history
    Then an error message is displayed stating 'Access Denied: You do not have permission to view transaction history.'

  Scenario: Scenario 4: User with permission to save but not to view transaction history
    Given the user does not have permission to check transaction history
    And the user has permission to keep a record
    When the user requests to save transaction history
    Then the user is informed with the message 'Cannot display transaction history; record saving only is permitted.'

  Scenario: Scenario 5: User with permission to view and save, AND another user with no permissions
    Given the user has permission to check transaction history
    And the user has permission to keep a record
    And another user does not have permission to check transaction history
    When the first user requests to view transaction history
    Then the transaction history is displayed
    And the save functionality is enabled
    And the second user requests to view transaction history
    Then an error message is displayed stating 'Access Denied: You do not have permission to view transaction history.'
