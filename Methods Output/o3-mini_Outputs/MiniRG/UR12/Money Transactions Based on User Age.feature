Feature: Money Transactions Based on User Age
  As a business owner,
  I want both adult and non-adult users to be able to perform transactions within set rules,
  So that the system enforces age-based transaction limits.

  Scenario: Adult user transactions
    Given the user is an adult
    When the user initiates a withdrawal transaction
    Then the withdrawal should be processed successfully
    When the user initiates a send money transaction for any amount
    Then the transaction should be processed successfully

  Scenario: Non-adult user send money limits
    Given the user is not an adult
    When the user initiates a send money transaction for an amount up to 20 euros
    Then the transaction should be processed successfully
    When the user initiates a send money transaction for an amount greater than 20 euros
    Then the transaction should be declined
