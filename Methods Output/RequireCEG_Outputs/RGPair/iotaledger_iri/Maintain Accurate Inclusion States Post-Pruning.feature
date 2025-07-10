Feature: Maintain Accurate Inclusion States Post-Pruning

  As a system administrator
  I want to ensure that transactions exceeding the pruning threshold are appropriately pruned
  So that the system maintains accurate transaction states and performance

  Background:
    Given the defined pruning depth is set
    And a transaction exists in the system

  Scenario: Scenario 1: Prune a Transaction Exceeding Pruning Depth
    Given a transaction that exceeds the pruning depth
    When the transaction is pruned
    Then the transaction should no longer be accessible through any queries or APIs
    And all neighboring nodes should synchronize their states immediately

  Scenario: Scenario 2: Confirm Status of Included Transaction in Milestone
    Given a transaction is included in a milestone
    When the milestone processing is completed
    Then the status of the transaction must be confirmed and retained in the system

  Scenario: Scenario 3: Transaction Not Created Below Pruning Threshold
    Given a transaction is created below the pruning threshold
    When the transaction is flagged for removal
    Then the transaction that was created below the pruning threshold is stored normally without restrictions

  Scenario: Scenario 4: Synchronization across Neighboring Nodes
    Given a transaction is flagged for removal across all nodes
    When the transaction is processed for removal
    Then all neighboring nodes must reflect the removal of the pruned transaction immediately

  Scenario Outline: Scenario Outline: Transaction Pruning Behavior
    Given a transaction is created with a depth of <depth>
    And the pruning threshold is <threshold>
    When the transaction attempts to be stored
    Then if the depth is above the threshold, it will be retained
    And if the depth is below the threshold, it will be flagged for removal
    Examples:
      | depth | threshold |
      | 5 | 10 |
      | 8 | 10 |
      | 3 | 5 |

