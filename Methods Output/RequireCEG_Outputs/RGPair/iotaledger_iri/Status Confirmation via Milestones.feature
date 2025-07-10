Feature: Status Confirmation via Milestones

  As a system administrator
  I want to confirm transaction statuses referenced by milestones
  So that I can ensure all related transactions reflect accurate and updated confirmations

  Background:
    Given a transaction is initiated
    And the transaction can be associated with one or more milestones

  Scenario: Scenario 1: Confirm a transaction with a milestone
    Given a transaction is referenced by a milestone
    When the milestone is confirmed
    Then the status of the transaction must reflect the confirmed state
    And all related transactions should have their statuses updated accordingly

  Scenario: Scenario 2: Handle multiple milestones for a transaction
    Given a single transaction tied to multiple milestones
    When the most recent milestone is confirmed
    Then the system should provide the most recent status confirmation

  Scenario: Scenario 3: Confirm zero-value transactions
    Given a transaction with a zero value is referenced by a milestone
    When the milestone is confirmed
    Then the transaction status must also be confirmed

  Scenario: Scenario 4: Ensure zero and non-zero transactions are treated the same
    Given one transaction with zero value and another with non-zero value are referenced by milestones
    When the milestones are confirmed
    Then the statuses of both transactions must reflect the confirmed state
    And the system treats both transactions equally in status confirmation

  Scenario: Scenario 5: Prune transactions below pruning depth
    Given a system enforces pruning depth of $150
    And the transactions are less than $150
    When a user attempts to access these transactions
    Then the user should not be able to view the pruned transactions

  Scenario Outline: Scenario Outline: Confirm transactions below pruning depth
    Given a system enforces pruning depth of <pruning-depth>
    And the transactions being less than <pruning-depth>
    When a user attempts to access these transactions
    Then the user should not be able to view the pruned transactions
    Examples:
      | pruning-depth | user-access |
      | $100 | access denied |
      | $200 | access denied |
      | $150 | access denied |

