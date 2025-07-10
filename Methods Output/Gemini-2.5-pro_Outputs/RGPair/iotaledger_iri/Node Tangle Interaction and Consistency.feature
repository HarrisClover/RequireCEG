Feature: Node Tangle Interaction and Consistency
  As a Network Maintainer
  I want nodes to reliably stitch transactions between main and side tangles
  So that the network remains consistent and stable even with complex tangle structures.

  Scenario: Stitching transactions across main and side tangles
    Given a network of multiple synchronized nodes
    And the network has existing main and side tangles
    When new transactions are issued that reference transactions in both the main and side tangles (stitching)
    And these transactions are propagated across the network
    Then the nodes should process these stitching transactions without crashing
    And the nodes' view of the tangle state should remain consistent with each other after processing.