Feature: Transaction Pruning Handling
  As a Node Operator
  I want the node to correctly handle pruned transaction data according to the pruning configuration
  So that storage is managed efficiently while maintaining accurate inclusion states for historical transactions.

  Scenario: Attempting to retrieve data for a pruned transaction
    Given a node that has performed database pruning up to milestone index <pruning_depth_index>
    And transaction 'T_OLD' was included in a milestone index below <pruning_depth_index>
    When an API call is made to retrieve the full data of transaction 'T_OLD'
    Then the API should return a response indicating the data is pruned or unavailable (e.g., specific error code or empty data field).

  Scenario: Retrieving data for a non-pruned transaction after pruning
    Given a node that has performed database pruning up to milestone index <pruning_depth_index>
    And transaction 'T_RECENT' was included in a milestone index at or above <pruning_depth_index>
    When an API call is made to retrieve the full data of transaction 'T_RECENT'
    Then the API should return a successful response containing the full data for 'T_RECENT'.

  Scenario: Verifying inclusion state of a pruned transaction
    Given a node that has performed database pruning up to milestone index <pruning_depth_index>
    And transaction 'T_CONFIRMED_OLD' was confirmed by a milestone index below <pruning_depth_index>
    When an API call is made to check the inclusion state or confirmation status of transaction 'T_CONFIRMED_OLD'
    Then the API should return the correct historical status (e.g., 'confirmed'), even though its full data might be pruned.

    Examples:
      | pruning_depth_index |
      | 10000               |
      | 60000               |