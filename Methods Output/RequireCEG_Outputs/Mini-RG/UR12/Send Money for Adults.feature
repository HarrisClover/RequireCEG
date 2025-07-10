Feature: Send Money for Adults

  As an adult user
  I want to send any amount of money as long as I have sufficient funds
  So that I can perform transactions without limitations

  Background:
    Given the user is identified as an adult
    And the user's account has sufficient funds

  Scenario: Scenario 1: Successful Transaction
    Given the user initiates a transaction of $150
    When the user confirms the transaction
    Then the account balance is reduced by $150
    And a message is displayed stating that the transfer was successful

  Scenario: Scenario 2: Insufficient Funds
    Given the user initiates a transaction of $300
    When the user confirms the transaction
    Then the transaction is not processed
    And an error message is displayed stating that insufficient funds are available

  Scenario: Scenario 3: Non-Adult Withdrawal Attempt with Over Limit
    Given the user is identified as not an adult
    And the user's account has sufficient funds of 30 euros
    When the user attempts to send 30 euros
    Then the transaction is not processed
    And an error message is displayed stating that the limit has been exceeded

  Scenario: Scenario 4: Non-Adult Withdrawal Attempt within Limit
    Given the user is identified as not an adult
    And the user's account has sufficient funds of 25 euros
    When the user attempts to send 20 euros
    Then the transaction is processed
    And a message is displayed stating that the transfer was successful

  Scenario Outline: Transaction Limit Check for Non-Adults
    Given the user is identified as not an adult
    And the user's account has sufficient funds of <funds>
    When the user attempts to send <amount> euros
    Then the transaction is <status>
    Examples:
      | funds | amount | status |
      | 25 euros | 20 euros | processed |
      | 30 euros | 30 euros | not processed with error message stating that the limit has been exceeded |

