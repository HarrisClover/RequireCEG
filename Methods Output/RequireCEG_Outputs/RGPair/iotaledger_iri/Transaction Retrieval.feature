Feature: Transaction Retrieval

  As a user of the system
  I want to retrieve transaction details by unique identifier
  So that I can view the current status and metadata of my transactions

  Background:
    Given a transaction exists in local storage
    And the transaction has a unique identifier

  Scenario: Scenario 1: Successful transaction retrieval
    Given a valid transaction ID is provided
    When the system retrieves the transaction
    Then the transaction details should include its current status
    And the transaction metadata must be returned

  Scenario: Scenario 2: Transaction not found
    Given an invalid transaction ID is provided
    When the system attempts to retrieve the transaction
    Then an error message should state that the transaction is unavailable

  Scenario: Scenario 3: Handling multiple transaction IDs
    Given multiple transaction IDs are provided
    When the system retrieves each transaction
    Then valid transaction details should be returned for existing transactions
    And non-existent transactions should be skipped

  Scenario: Scenario 4: Transaction retrieval with pruning
    Given a transaction ID is provided
    When the system checks if the transaction has been pruned
    Then if the transaction has been pruned, an error message should state that the transaction is unavailable

  Scenario Outline: Scenario Outline: Transaction retrieval with milestones
    Given a transaction ID is <transaction-id>
    And the transaction is referenced by a milestone <milestone-id>
    When the system checks the transaction status
    Then the status of the transaction should be based on the latest snapshot
    Examples:
      | transaction-id | milestone-id |
      | TX123 | ML456 |
      | TX789 | ML101 |

