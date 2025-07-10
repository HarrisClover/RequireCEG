Feature: Validation of Pruned Transactions

  As a user of the transaction system
  I want to ensure that only valid, non-pruned transactions are available
  So that I can reliably access my transactions and maintain transaction integrity

  Background:
    Given a defined pruning depth exists
    And transactions can be pruned based on their validity

  Scenario: Scenario 1: Accessing a pruned transaction
    Given a transaction has been pruned
    When a user attempts to access the pruned transaction
    Then the system should respond with 'Transaction is no longer available.'

  Scenario: Scenario 2: Creating a transaction with a pruned transaction
    Given a user attempts to create a new transaction using a pruned transaction
    Then the system should reject the request and notify with 'Transaction is pruned and cannot be used.'

  Scenario: Scenario 3: Broadcasting valid transactions
    Given a set of transactions including pruned ones
    When the system broadcasts transactions to neighboring nodes
    Then only valid, non-pruned transactions are included in the broadcast

  Scenario: Scenario 4: Validation of transactions during checks with pruning depth set to valid levels - valid transaction status check with depth 3 and valid transaction status should be returned valid transaction response correctly, and also validate pruning depth on pruned transactions - expected response should define transaction is pruned when it’s pruned indicating no access to pruned transaction, and consistently check back for maintained transactions with depth set to 1 valid showing given transaction.
    Given a transaction with status 'valid'
    And the pruning depth is 'depth 3'
    When the user checks the transaction status
    Then the system should return 'valid transaction'

  Scenario Outline: Scenario Outline: Validating transaction status
    Given a transaction with status <status>
    And the pruning depth is <depth>
    When the user checks the transaction status
    Then the system should return <return-status>
    Examples:
      | status | depth | return-status |
      | valid | depth 3 | valid transaction |
      | pruned | depth 3 | transaction is pruned |
      | valid | depth 1 | valid transaction |

