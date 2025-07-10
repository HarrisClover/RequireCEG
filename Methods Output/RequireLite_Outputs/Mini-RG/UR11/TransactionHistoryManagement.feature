Feature: TransactionHistoryManagement

  As a store owner
  I want to check and keep a record of transaction history
  So that I can review transactions whenever necessary

  Background:
    Given I have logged into the system
    And I have permission to check transaction history

  Scenario: Check and Keep Record
    Given I have permission to check and keep a record of transaction history
    When I access the transaction history
    Then I should be able to view transaction history
    And I should be able to keep a record of transaction history

  Scenario: Check Without Keeping Record
    Given I have permission to check transaction history but not to keep a record
    When I access the transaction history
    Then I should be able to view transaction history

  Scenario: No Permission
    Given I do not have permission to check transaction history
    When I attempt to access the transaction history
    Then I should not be able to view or keep a record of transaction history

  Scenario Outline: Permission and Actions
    Given I have <permission> to check transaction history
    When I attempt to access the transaction history
    Then I should <outcome>
    And I want to <action>
    Examples:
      | permission | action | outcome |
      | permission to check and keep record | keep a record | be able to view and keep a record of transaction history |
      | permission to check only | view only | be able to view transaction history |
      | no permission | attempt to access | not be able to view or keep a record of transaction history |

