Feature: Generate Transaction Reports

  As a store owner
  I want to log and monitor all transactions by users based on their classification (adult/non-adult)
  So that I can ensure compliance with transaction policies and maintain accurate financial records

  Background:
    Given the user classification criteria are established
    And the transaction logging mechanism is in place

  Scenario: Scenario 1: Adult User Transaction
    Given an adult user is logged into the system
    When the user sends €50
    Then the transaction should be logged in the report
    And the amount sent is displayed in the report

  Scenario: Scenario 2: Non-Adult Sending Limit Breach
    Given a non-adult user is logged into the system
    When the user attempts to send €30
    Then an error message should be logged indicating the breach of sending limit should be displayed in the report

  Scenario: Scenario 3: Non-Adult Valid Transaction
    Given a non-adult user is logged into the system
    When the user sends €20
    Then the transaction should be recorded in the report
    And the amount sent is displayed in the report

  Scenario: Scenario 4: Non-Adult Withdrawal
    Given a non-adult user is logged into the system
    When the user withdraws €15
    Then the withdrawal transaction should be recorded in the transaction report
    And the amount withdrawn is not displayed in the report

  Scenario Outline: Scenario Outline: Aggregate Transaction Summary
    Given an aggregated transaction report is requested for <user-classification>
    When the report is generated
    Then the report should summarize the count of transactions and total amounts for <user-classification>
    Examples:
      | user-classification | transaction-count | total-amount |
      | adult | 5 | €250 |
      | non-adult | 3 | €50 |

