Feature: Accurately Compute Total Price Based on Quantity

  As a customer
  I want to ensure that I can purchase items within my budget and a valid quantity
  So that I can finalize my purchase without any issues

  Background:
    Given a customer has a remaining balance
    And the price of the items they want to purchase is known

  Scenario: Valid quantity and sufficient funds
    Given the customer selects a valid quantity of 3 items
    And the unit price of the item is $50
    When the customer proceeds to buy the items
    Then the total price displayed should be $150
    And the customer's remaining balance should be updated to $X

  Scenario: Quantity less than 1
    Given the customer selects a quantity of 0 items
    When the customer attempts to add items to the basket
    Then the system should notify the customer with the message 'Quantity must be between 1 and 10.'

  Scenario: Quantity greater than 10
    Given the customer selects a quantity of 11 items
    When the customer tries to add items to the basket
    Then the system should display an error message stating 'Quantity must be between 1 and 10.'

  Scenario: Insufficient funds for purchase
    Given the customer selects a valid quantity of 5 items
    And the unit price of the item is $40
    When the total price exceeds the customer's remaining balance of $150
    Then the system should notify the customer with the message 'Insufficient funds for this transaction.'

  Scenario: Valid quantity within budget and funds
    Given the customer selects a valid quantity of 2 items
    And the unit price of the item is $20
    When the customer proceeds to buy the items
    Then the total price displayed should be $40
    And the customer's remaining balance should be updated accordingly

  Scenario Outline: Valid quantity with balance check
    Given the customer selects a quantity of <quantity> items
    And the unit price of each item is <unit-price>
    When the customer attempts to make the purchase
    Then the total should be <total>
    And the balance should be updated if funds are sufficient
    Examples:
      | quantity | unit-price | total |
      | 1 | $20 | $20 |
      | 5 | $30 | $150 |
      | 3 | $25 | $75 |
      | 2 | $15 | $30 |

