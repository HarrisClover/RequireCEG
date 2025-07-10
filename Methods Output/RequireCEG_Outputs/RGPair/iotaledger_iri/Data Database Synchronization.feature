Feature: Data Database Synchronization

  As a node in the network
  I want to synchronize my state with the data database and ensure transaction consistency
  So that the network maintains a reliable and consistent view of transactions

  Background:
    Given that a node is bootstrapping from a Local Snapshot
    And it must synchronize all relevant states with the data database

  Scenario: Check transaction consistency on bootstrapping
    Given the node has been successfully bootstrapped
    When the node receives a transaction
    Then the node verifies the transaction status
    And the node ensures consistency with all transactions referenced by milestones

  Scenario: Check transaction status upon receipt
    Given the node has received a transaction
    When the transaction holds a non-zero value
    Then the node verifies the status of the received transaction

  Scenario: Remove disconnected neighbor
    Given the node checks its connectivity with neighbors
    When a disconnected neighbor is detected
    Then the node removes the disconnected neighbor from its peer list

  Scenario: Synchronize with a new neighbor
    Given the node has added a new neighbor
    When the node establishes a connection with the new neighbor
    Then the node commences synchronization of new transactions with this neighbor

  Scenario: Ensure synchronization processes are not disrupted
    Given the node is actively synchronizing with other neighbors
    When the node successfully synchronizes with the data database
    Then the ongoing synchronization processes with other neighbors are not disrupted

  Scenario Outline: Transaction pruning and accessibility
    Given the transaction has been pruned and falls under the defined pruning depth
    When the node checks the accessibility of the transaction
    Then the transaction is rendered inaccessible
    Examples:
      | transaction status | pruning depth | accessibility |
      | pruned | 3 | inaccessible |
      | active | 5 | accessible |
      | pruned | 2 | inaccessible |

