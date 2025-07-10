Feature: Transaction History Access and Record Keeping
  As a store owner,
  I want to check and keep a record of transaction history,
  So that I can manage transaction data as per my permissions.

  Scenario: Checking and keeping record of transaction history with full permission
    Given I have permission to check and keep a record of transaction history
    When I check the transaction history
    Then I should be able to keep a record of the transaction history

  Scenario: Checking transaction history without keeping record
    Given I have permission to check transaction history but not keep a record
    When I check the transaction history
    Then I should not be able to keep a record of the transaction history

  Scenario: Not able to check or keep record of transaction history without permission
    Given I do not have permission to check or keep a record of transaction history
    When I try to check the transaction history
    Then I should not be able to check or keep a record of the transaction history

  Scenario: Checking transaction history and keeping a record only when requested
    Given I have permission to check transaction history and keep a record of it
    When I check the transaction history
    Then I should be able to keep a record of the transaction history if I choose to
    And I should not be able to keep a record if I do not choose to
