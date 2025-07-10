Feature: Apply Shipping Fee Based on Total Amount

  As a store owner
  I want to set specific shipping fees based on the total amount in the cart
  So that customers are informed of the shipping costs based on their purchases

  Background:
    Given the shipping fee structure is defined
    And the customer has items in their cart

  Scenario: Apply Shipping Fee of $8.99 for Exactly $75
    Given the total amount in the cart is exactly $75
    When the customer proceeds to checkout
    Then the shipping fee should be $8.99

  Scenario: Apply Shipping Fee of $3.99 for Totals Below $75
    Given the total amount in the cart is $20
    When the customer checks out
    Then the shipping fee should be $3.99

  Scenario: Apply Shipping Fee of $4.99 for Totals Between $25 and $50
    Given the total amount in the cart is $30
    When the customer checks out
    Then the shipping fee should be $4.99

  Scenario: Apply Shipping Fee of $6.99 for Totals Between $50 and $75
    Given the total amount in the cart is $60
    When the customer checks out
    Then the shipping fee should be $6.99

  Scenario: Apply Shipping Fee of $10.99 for Totals Exactly $100
    Given the total amount in the cart is exactly $100
    When the customer checks out
    Then the shipping fee should be $10.99

  Scenario: Apply Shipping Fee of $10.99 for Totals Above $100
    Given the total amount in the cart is $150
    When the customer checks out
    Then the shipping fee should be $10.99

  Scenario: Apply Shipping Fee of $10.99 for Totals Above $75 but Below $100
    Given the total amount in the cart is $80
    When the customer checks out
    Then the shipping fee should be $10.99

  Scenario Outline: Scenario Outline: Shipping Fee Based on Total Amount
    Given the total amount is <total>
    When the customer checks out
    Then the shipping fee should be <shipping_fee>
    Examples:
      | total | shipping_fee |
      | $75 | $8.99 |
      | $20 | $3.99 |
      | $30 | $4.99 |
      | $60 | $6.99 |
      | $100 | $10.99 |
      | $150 | $10.99 |
      | $80 | $10.99 |

