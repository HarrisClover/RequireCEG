Feature: Zero-Value Transaction Processing

  As a system administrator
  I want to validate and manage zero-value transactions effectively
  So that the system maintains accurate transaction statuses and ensures proper handling in various scenarios.

  Background:
    Given the system is operational
    And the transaction rules for zero-value transactions are defined

  Scenario: Scenario 1: Validate Zero-Value Transaction Creation
    Given a zero-value transaction is initiated
    When the transaction is submitted for creation
    Then the transaction should be validated successfully
    And the transaction should be stored within the system

  Scenario: Scenario 2: Milestone Status Update on Zero-Value Transaction
    Given a zero-value transaction is linked to a milestone
    When the transaction is confirmed
    Then the milestone's status should be updated to 'confirmed'
    And the transaction status should also be updated to 'confirmed'

  Scenario: Scenario 3: Synchronize Node Interactions
    Given a zero-value transaction is involved in stitching operations
    When interactions with main and side tangles occur
    Then the system should synchronize the node interactions to prevent errors

  Scenario: Scenario 4: Inquire Status of Zero-Value Transaction
    Given a neighboring node inquires about the zero-value transaction's status
    When the inquiry is processed
    Then the system should respond with accurate current information reflecting the transaction's status

  Scenario: Scenario 5: Handle Pruning of Zero-Value Transaction
    Given the zero-value transaction is subject to pruning
    When the pruning operation is executed
    Then the transaction must be rendered inaccessible
    And the system should maintain accurate records of its inclusion or exclusion based on pruning depth metrics

  Scenario: Scenario 6: Validate Zero-Value Pruning Status
    Given a zero-value transaction has undergone pruning
    When an inquiry for the transaction is made
    Then the system should indicate that the transaction is inaccessible
    And a record must exist to track its pruning status based on enforced depth metrics
