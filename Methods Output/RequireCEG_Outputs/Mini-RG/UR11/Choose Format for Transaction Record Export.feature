Feature: Choose Format for Transaction Record Export

  As a user with permissions
  I want to access the transaction history and choose the export format
  So that I can effectively utilize the transaction data for my needs

  Background:
    Given a user is logged into the system
    And the user has specific permissions set for transaction history

  Scenario: Scenario 1: User with full permissions
    Given a user has permission to check transaction history
    And the user also has permission to keep records
    When the user requests access to the transaction history
    Then the system displays the transaction history
    And the user is presented with options to export the data in PDF, CSV, or Excel formats

  Scenario: Scenario 2: User with view-only permission
    Given a user has permission to check transaction history
    And the user lacks permission to keep records
    When the user requests access to the transaction history
    Then the system displays the transaction history
    And the user is not offered any export options

  Scenario: Scenario 3: User without permissions
    Given a user does not have permission to check transaction history
    When the user attempts to access the transaction history
    Then the system denies access
    And the user is presented with a message stating that access is restricted due to insufficient permissions

  Scenario: Scenario 4: User with insufficient permissions to keep records
    Given a user has permission to check transaction history
    And the user does not have permission to keep records
    When the user requests access to the transaction history
    Then the system displays the transaction history
    And the user is not presented with options to export the data

  Scenario: Scenario 5: User with denied access
    Given a user does not have permission to check transaction history
    When the user requests access to the transaction history
    Then the system denies access
    And the user is presented with a message stating that access is restricted due to insufficient permissions
