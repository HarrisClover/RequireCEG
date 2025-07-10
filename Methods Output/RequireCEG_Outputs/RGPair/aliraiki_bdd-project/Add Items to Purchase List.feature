Feature: Add Items to Purchase List

  As a customer
  I want to add items to my purchase list and ensure I have sufficient balance
  So that I can successfully complete my purchase without issues

  Background:
    Given the user has a balance greater than zero
    And the user is logged into the System

  Scenario: Scenario 1: Successful purchase with sufficient balance
    Given the user selects an item with a price of $50
    And the user selects a quantity of 2
    When the user clicks the Buy symbol
    Then the total price should be $100
    And the item should be added to the purchase list
    And the remaining balance is updated accordingly

  Scenario: Scenario 2: Insufficient funds
    Given the user has a balance of $40
    When the user selects an item with a price of $50
    Then an error message should state 'Insufficient funds'
    And the remaining balance is not updated

  Scenario: Scenario 3: Invalid quantity selection
    Given the user selects an item with a price of $30
    When the user selects a quantity of 0
    Then the system should prompt the user to enter a valid quantity
    And the item should not be added to the purchase list

  Scenario: Scenario 4: Invalid quantity exceeds limit
    Given the user selects an item with a price of $30
    When the user selects a quantity of 11
    Then the system should prompt the user to enter a valid quantity
    And the item should not be added to the purchase list

  Scenario Outline: Scenario Outline: Quantity boundary checks
    Given the user selects an item with a price of $<item-price>
    And the user selects a quantity of <quantity>
    When the user clicks the Buy symbol
    Then the total price should be $<expected-total>
    Examples:
      | item-price | quantity | expected-total |
      | 20 | 1 | 20 |
      | 100 | 10 | 1000 |
      | 50 | 11 | Invalid quantity notification |
      | 30 | -1 | Invalid quantity notification |

