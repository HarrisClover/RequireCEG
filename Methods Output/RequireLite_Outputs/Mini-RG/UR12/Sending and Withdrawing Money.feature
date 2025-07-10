Feature: Sending and Withdrawing Money

  As a store owner or customer
  I want to send and withdraw money based on age
  So that I can ensure transactions are appropriately handled for adults and non-adults

  Background:
    Given the system verifies the age of users
    And non-adult users have a maximum transaction limit of €20

  Scenario: Scenario 1: Adult User Sending Money
    Given an adult user logs into the system
    When the user sends €50
    Then the transaction is successful
    And the balance is updated accordingly

  Scenario: Scenario 2: Adult User Withdrawing Money
    Given an adult user logs into the system
    When the user withdraws €100
    Then the withdrawal is successful
    And the account balance is reduced by €100

  Scenario: Scenario 3: Non-Adult User Sending Money
    Given a non-adult user logs into the system
    When the user attempts to send €25
    Then the transaction fails
    And the user is notified of the limit

  Scenario Outline: Scenario Outline: Non-Adult User Sending Money
    Given a non-adult user logs into the system
    When the transaction is processed
    Then the transaction <outcome>
    And the user attempts to send <amount>
    Examples:
      | amount | outcome |
      | €10 | is successful |
      | €20 | is successful |
      | €25 | fails due to age limit |

