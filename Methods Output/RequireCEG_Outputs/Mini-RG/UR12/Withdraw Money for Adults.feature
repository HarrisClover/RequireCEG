Feature: Withdraw Money for Adults

  As a bank customer
  I want to withdraw money from my account if I am an adult
  So that I can access my funds freely without restrictions

  Background:
    Given a user has an account
    And the user has entered their age

  Scenario: Scenario 1: Successful Withdrawal for Adults
    Given the user is 18 years or older
    And the user has sufficient funds in their account
    When the user requests to withdraw $100
    Then the transaction is processed successfully
    And the user's account balance is updated accordingly

  Scenario: Scenario 2: Denied Withdrawal for Non-Adults
    Given the user is under 18 years old
    When the user attempts to withdraw $50
    Then the withdrawal is denied
    And the message 'Withdrawal not allowed for non-adults.' is displayed

  Scenario: Scenario 3: Successful Withdrawal when age is 18
    Given the user is 18 years old
    And the user has sufficient funds in their account
    When the user requests to withdraw $50
    Then the transaction is processed successfully
    And the user's account balance is updated accordingly

  Scenario: Scenario 4: Denied Withdrawal when age is under 18
    Given the user is 17 years old
    When the user requests to withdraw $20
    Then the withdrawal is denied
    And the message 'Withdrawal not allowed for non-adults.' is displayed

  Scenario Outline: Scenario Outline: Withdrawal Amount and Age
    Given the user is <age> years old
    And the user has an account with a balance of <balance>
    When the user requests to withdraw <withdrawal-amount>
    Then if the user is an adult, the transaction is processed successfully, otherwise the withdrawal is denied
    Examples:
      | age | balance | withdrawal-amount |
      | 18 | $200 | $50 |
      | 25 | $500 | $100 |
      | 17 | $300 | $20 |
      | 16 | $100 | $10 |

