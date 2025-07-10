Feature: Apply Shipping Fee for Various Total Amounts

  As a store owner
  I want to apply appropriate shipping fees based on total amounts
  So that customers are correctly charged for shipping based on their order total

  Background:
    Given a customer has items in their shopping cart
    And the shopping cart total is calculated

  Scenario: Apply $6.99 Shipping Fee for Total of Exactly $50
    Given the total amount in the cart is exactly $50
    Then the shipping fee should be $6.99

  Scenario: Apply $3.99 Shipping Fee for Total Less Than or Equal to $25
    Given the total amount in the cart is less than or equal to $25
    Then the shipping fee should be $3.99

  Scenario: Apply $4.99 Shipping Fee for Total of Exactly $25
    Given the total amount in the cart is exactly $25
    Then the shipping fee should be $4.99

  Scenario: Apply $4.99 Shipping Fee for Total Greater Than $25 but Less Than $50
    Given the total amount in the cart is greater than $25 but less than $50
    Then the shipping fee should be $4.99

  Scenario: Apply $6.99 Shipping Fee for Total Greater Than $50 and Less Than or Equal to $75
    Given the total amount in the cart is greater than $50 and less than or equal to $75
    Then the shipping fee should be $6.99

  Scenario: Apply $8.99 Shipping Fee for Total of Exactly $75
    Given the total amount in the cart is exactly $75
    Then the shipping fee should be $8.99

  Scenario: Apply $8.99 Shipping Fee for Total Greater Than $75 and Up to $100
    Given the total amount in the cart is greater than $75 but up to $100
    Then the shipping fee should be $8.99

  Scenario: Apply $10.99 Shipping Fee for Total of Exactly $100
    Given the total amount in the cart is exactly $100
    Then the shipping fee should be $10.99

  Scenario: Apply $10.99 Shipping Fee for Total Exceeding $100
    Given the total amount in the cart exceeds $100
    Then the shipping fee should be $10.99

  Scenario: Display Promotions for Total of $50
    Given the total amount in the cart is exactly $50
    Then the promotions or discounts should be displayed clearly to the user

  Scenario: Display Promotions for Total of $25 or Less
    Given the total amount in the cart is less than or equal to $25
    Then the promotions or discounts should be displayed clearly to the user

  Scenario: Display Promotions for Total Greater Than $75
    Given the total amount in the cart is greater than $75 but less than or equal to $100
    Then the promotions or discounts should be displayed clearly to the user

  Scenario: Display Promotions for Total of $100
    Given the total amount in the cart is exactly $100
    Then the promotions or discounts should be displayed clearly to the user

  Scenario: Display Promotions for Total Exceeding $100
    Given the total amount in the cart exceeds $100
    Then the promotions or discounts should be displayed clearly to the user
