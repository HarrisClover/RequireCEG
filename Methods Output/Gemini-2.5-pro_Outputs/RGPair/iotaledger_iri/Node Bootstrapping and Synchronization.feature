Feature: Node Bootstrapping and Synchronization
  As a Node Operator
  I want nodes to bootstrap and synchronize correctly using different data sources
  So that new or restarting nodes can reliably join the network and maintain a consistent state.

  Scenario Outline: Node boots and synchronizes from a Local Snapshot
    Given a node configured to use Local Snapshots for bootstrapping
    And a valid Local Snapshot file exists for milestone index <snapshot_index>
    When the node starts
    Then the node should successfully bootstrap from the snapshot
    And the node should synchronize with its neighbors
    And the node's solid milestone index should eventually reach at least <snapshot_index>
    And the node's state (e.g., ledger state) should be consistent with other fully synchronized nodes.

    Examples:
      | snapshot_index |
      | 1000           |
      | 50000          |

  Scenario Outline: Node boots and synchronizes from an existing database
    Given a node with an existing database containing data up to milestone <db_milestone_index>
    And the node is configured to synchronize from its database state
    When the node starts
    Then the node should initialize from its database state
    And the node should synchronize with its neighbors starting from its current state
    And the node's solid milestone index should eventually advance beyond <db_milestone_index>
    And the node's state should be consistent with other fully synchronized nodes.

    Examples:
      | db_milestone_index |
      | 2500               |
      | 75000              |