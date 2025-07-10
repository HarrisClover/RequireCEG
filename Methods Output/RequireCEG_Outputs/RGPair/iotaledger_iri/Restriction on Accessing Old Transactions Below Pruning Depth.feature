Feature: Restriction on Accessing Old Transactions Below Pruning Depth

  As a user
  I want to access my transaction history
  So that I can review my past transactions and their statuses

  Background:
    Given the system has a defined pruning depth for transaction access
    And I have logged into the system

  Scenario: Transaction is older than pruning depth
    Given a transaction that is older than the defined pruning depth
    When I try to access the transaction
    Then an error message 'Transaction not accessible due to pruning policy.' is displayed
    And no further action is taken

  Scenario: Transaction within pruning depth and referenced by milestones
    Given a transaction that is within the pruning depth
    And the transaction status is 'referenced by milestones'
    When I try to access the transaction
    Then the transaction details are retrieved and displayed
    And a confirmation message 'Transaction is confirmed and available.' is provided

  Scenario: Transaction within pruning depth but not referenced by milestones
    Given a transaction that is within the pruning depth
    And the transaction status is not 'referenced by milestones'
    When I try to access the transaction
    Then access to the transaction is denied
    And I cannot view the transaction details

  Scenario: Transaction situation with defined status
    Given a transaction that is within the pruning depth
    And the transaction status is 'referenced by milestones'
    When I try to access the transaction
    Then the transaction details are retrieved and displayed
    And a confirmation message 'Transaction is confirmed and available.' is provided

  Scenario Outline: Scenario Outline: Accessing Transaction Based on Pruning Depth
    Given a transaction age of <transaction-age>
    And the transaction status is <status>
    When I attempt to access the transaction
    Then <expected-outcome>
    Examples:
      | transaction-age | status | expected-outcome |
      | 6 months | referenced by milestones | transaction details are displayed and confirmation message is shown |
      | 1 year | not referenced by milestones | access to the transaction is denied |
      | 3 months | referenced by milestones | transaction details are displayed and confirmation message is shown |
      | 8 months | not referenced by milestones | access to the transaction is denied |

