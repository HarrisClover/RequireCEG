Feature: Transaction Confirmation via Milestones
  As a User or Application
  I want the system to correctly confirm the status of different transaction types based on milestones
  So that I can rely on the finality status reported by the nodes.

  Scenario: Confirming a zero-value transaction
    Given a network of synchronized nodes
    And a zero-value transaction 'T_ZERO' has been issued and propagated
    When a milestone 'M' is issued that directly or indirectly references transaction 'T_ZERO'
    And the nodes process milestone 'M'
    Then querying the status of transaction 'T_ZERO' should eventually return 'confirmed'.

  Scenario: Confirming a value transaction
    Given a network of synchronized nodes
    And a value transaction 'T_VALUE' has been issued and propagated
    When a milestone 'M' is issued that directly or indirectly references transaction 'T_VALUE'
    And the nodes process milestone 'M'
    Then querying the status of transaction 'T_VALUE' should eventually return 'confirmed'.