Feature: Send Money for Non-Adults with Limit

  As a non-adult sender
  I want to send money within the limits set for my age group
  So that I can make transactions without encountering restrictions unnecessarily

  Background:
    Given the sender's age is verified
    And the sender is registered in the system

  Scenario: Scenario 1: Adult sender sending any amount
    Given the sender's age is 18 or older
    When the sender attempts to send 100 euros
    Then the transaction should proceed without restrictions
    And no error message should be displayed

  Scenario: Scenario 2: Non-adult sender sending within limit
    Given the sender's age is 17
    When the sender attempts to send 20 euros
    Then the transaction should be processed successfully

  Scenario: Scenario 3: Non-adult sender exceeding limit
    Given the sender's age is 16
    When the sender attempts to send 25 euros
    Then the transaction should be prevented
    And the message 'You can only send up to 20 euros as a non-adult.' should be displayed

  Scenario: Scenario 4: Non-adult sender withdrawing money
    Given the sender's age is 15
    When the sender attempts to withdraw 50 euros
    Then the transaction should be stopped
    And the message 'Only adults can withdraw money.' should be displayed

  Scenario: Scenario 5: Handling error for non-adult sender
    Given the sender's age is 15
    When the sender attempts to withdraw 10 euros
    Then the transaction should be stopped
    And the message 'Only adults can withdraw money.' should be displayed

  Scenario Outline: Scenario Outline: Sending money as a non-adult
    Given the sender's age is <age>
    And the sender attempts to send <amount> euros
    When the transaction is processed
    Then the transaction should <result>
    And <message>
    Examples:
      | age | amount | result | message |
      | 17 | 20 | be processed successfully |  |
      | 16 | 25 | be blocked | You can only send up to 20 euros as a non-adult. |
      | 15 | 10 | be processed successfully |  |

