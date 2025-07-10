Feature: Calculate Shipping for Cart Total = $100

  As a store owner
  I want to apply appropriate shipping fees based on the total amount in the shopping cart
  So that customers know their total cost including shipping

  Background:
    Given the customer has items in their shopping cart
    And the system is ready to calculate the total amount

  Scenario: Scenario 1: Total exactly $100
    Given the total amount in the cart is $100
    Then the shipping fee should be $10.99
    And the total cost including shipping should be $110.99

  Scenario: Scenario 2: Total less than or equal to $75
    Given the total amount in the cart is $75
    Then the shipping fee should be $8.99
    And the total cost including shipping should be $83.99

  Scenario: Scenario 3: Total between $75 and $100
    Given the total amount in the cart is $90
    Then the shipping fee should be $8.99
    And the total cost including shipping should be $98.99

  Scenario: Scenario 4: No applicable promotions or discounts
    Given the total amount in the cart is $60
    And there are no applicable promotions or discounts
    When the system calculates the shipping fee
    Then the shipping fee should be $8.99
    And the total cost including shipping should be $68.99

  Scenario Outline: Scenario Outline: Varying Total Amounts
    Given the total amount in the cart is <total>
    When the system calculates the shipping fee
    Then the shipping fee should be <shipping-fee>
    And the total cost including shipping should be <total-including-shipping>
    Examples:
      | total | shipping-fee | total-including-shipping |
      | $60 | $8.99 | $68.99 |
      | $80 | $8.99 | $88.99 |
      | $100 | $10.99 | $110.99 |

