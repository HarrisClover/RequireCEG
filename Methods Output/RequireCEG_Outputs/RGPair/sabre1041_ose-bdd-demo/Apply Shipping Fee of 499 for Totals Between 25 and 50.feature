Feature: Apply Shipping Fee of $4.99 for Totals Between $25 and $50

  As a customer
  I want to know the shipping fee based on my total purchase amount
  So that I can understand the total cost before checkout

  Background:
    Given that the shopping cart has been initialized
    And the customer is logged into the system

  Scenario: Scenario 1: Total is exactly $25
    Given the total price in the cart is $25
    When the customer proceeds to checkout
    Then the shipping fee should be $4.99
    And the total should be $29.99

  Scenario: Scenario 2: Total is between $25 and $50
    Given the total price in the cart is $40
    When the customer proceeds to checkout
    Then the shipping fee should be $4.99
    And the total should be $44.99

  Scenario: Scenario 3: Total is exactly $50
    Given the total price in the cart is $50
    When the customer proceeds to checkout
    Then the shipping fee should be $6.99
    And the total should be $56.99

  Scenario: Scenario 4: Total is below $25
    Given the total price in the cart is $20
    When the customer proceeds to checkout
    Then no shipping fee should apply
    And the customer should see a reminder of the minimum purchase requirement for free shipping

  Scenario: Scenario 5: Total is exactly $25
    Given the total price in the cart is $25
    When the customer proceeds to checkout
    Then the shipping fee should be $4.99
    And the total should be $29.99

  Scenario Outline: Scenario Outline: Various total amounts and shipping fees
    Given the total price in the cart is <total-amount>
    When the customer proceeds to checkout
    Then the shipping fee should be <shipping-fee>
    And the total should be <new-total>
    Examples:
      | total-amount | shipping-fee | new-total |
      | $25 | $4.99 | $29.99 |
      | $40 | $4.99 | $44.99 |
      | $50 | $6.99 | $56.99 |
      | $20 | $0.00 | $20.00 |

