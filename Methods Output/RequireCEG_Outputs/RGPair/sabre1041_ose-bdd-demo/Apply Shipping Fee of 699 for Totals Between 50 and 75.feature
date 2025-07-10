Feature: Apply Shipping Fee based on Total Price of Items in Cart

  As a store owner
  I want to implement shipping fees based on the total price of items in the shopping cart
  So that customers are aware of additional costs before finalizing their purchase

  Background:
    Given the customer is logged into the system
    And the total price of items in the shopping cart is calculated

  Scenario: Shipping fee applied for a total of $50
    Given the total price is exactly $50
    When the customer proceeds to checkout
    Then the shipping fee of $6.99 should be added to the final price
    And the final price presented should be $56.99

  Scenario: Shipping fee applied for a total of $68
    Given the total price is $68
    When the customer proceeds to checkout
    Then the shipping fee of $6.99 should be added to the final price
    And the final price presented should be $74.99

  Scenario: Shipping fee applied for a total of $85
    Given the total price is $85
    When the customer proceeds to checkout
    Then the shipping fee of $8.99 should be added to the final price
    And the final price presented should be $93.99

  Scenario: Shipping fee applied for a total of $72
    Given the total price is $72
    When the customer proceeds to checkout
    Then the shipping fee of $6.99 should be added to the final price
    And the final price presented should be $78.99

  Scenario Outline: Evaluate shipping fee based on total price
    Given the total price is <total-price>
    When the customer proceeds to checkout
    Then the shipping fee of <shipping-fee> should be added to the final price
    And the final price presented should be <final-price>
    Examples:
      | total-price | shipping-fee | final-price |
      | $50 | $6.99 | $56.99 |
      | $72 | $6.99 | $78.99 |
      | $100 | $8.99 | $108.99 |

