Feature: Manage Account Balance with Credit Transactions

  As a user
  I want to add credit to my account
  So that I can ensure my account has sufficient funds for transactions

  Background:
    Given the user has an existing account
    And the current balance is $100

  Scenario: Scenario 1: Valid credit addition
    Given the credit amount is $50
    When the user requests to add credit to the account
    Then the account balance should be updated to $150
    And no error messages should be displayed

  Scenario: Scenario 2: Negative credit amount
    Given the credit amount is -$20
    When the user requests to add credit to the account
    Then the account balance should remain $100
    And the error message 'The credit amount must be positive' should be displayed

  Scenario: Scenario 3: Credit addition exceeds balance limit
    Given the credit amount is $1000
    When the user requests to add credit to the account
    Then the account balance should be updated to $1100
    And the message 'Your balance limit has been reached' should be displayed

  Scenario: Scenario 4: Credit transaction processing failure
    Given the credit amount is $500
    When the user requests to add credit to the account
    Then the account balance should remain $100
    And the system provides an error code and a message specifying the nature of the failure

  Scenario Outline: Scenario Outline: Credit transaction processing
    Given the credit amount is <credit-amount>
    When the user requests to add credit to the account
    Then the account balance should be updated to <updated-balance>
    And the transaction status should be <transaction-status>
    Examples:
      | credit-amount | updated-balance | transaction-status |
      | $50 | $150 | success |
      | -$20 | $100 | failed: The credit amount must be positive |
      | $1000 | $1100 | success: Your balance limit has been reached |
      | $200 | $300 | success |

