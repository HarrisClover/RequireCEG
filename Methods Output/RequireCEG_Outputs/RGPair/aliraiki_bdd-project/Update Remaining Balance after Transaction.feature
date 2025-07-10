Feature: Update Remaining Balance after Transaction

  As a customer
  I want to ensure that my balance is updated after completing a purchase
  So that I can keep track of my available funds accurately

  Background:
    Given the customer has logged into the system
    And the customer has sufficient funds in their balance

  Scenario: Scenario 1: Successful purchase within budget
    Given the total cost for 3 items is $250
    And the customer's balance is $300
    When the customer attempts to purchase the items
    Then the transaction should be completed successfully
    And the customer's balance should be updated to $50

  Scenario: Scenario 2: Insufficient funds for purchase
    Given the total cost for 5 items is $600
    And the customer's balance is $500
    When the customer attempts to purchase the items
    Then the transaction should fail
    And an error message should indicate insufficient funds

  Scenario: Scenario 3: Validate item selection exceeds limit
    Given the customer selects 12 items
    When the customer attempts to proceed with the purchase
    Then the system should show a validation error message indicating that purchases must be between 1 and 10 items

  Scenario: Scenario 4: Successful purchase for minimum quantity
    Given the total cost for 1 item is $100
    And the customer's balance is $150
    When the customer attempts to purchase the items
    Then the transaction should be completed successfully
    And the customer's balance should be updated to $50

  Scenario Outline: Scenario Outline: Successful transactions for valid item counts
    Given the total cost for <number> items is <total-cost>
    And the customer's balance is <customer-balance>
    When the customer attempts to purchase the items
    Then the transaction should be completed successfully
    And the customer's balance should be <remaining-balance>
    Examples:
      | number | total-cost | customer-balance | remaining-balance |
      | 3 | $250 | $300 | $50 |
      | 1 | $100 | $150 | $50 |
      | 5 | $400 | $500 | $100 |

