Feature: Calculate Shipping for Cart Total = $50

  As a store owner
  I want to calculate shipping costs based on the total amount in the shopping cart
  So that customers are informed of shipping fees based on their purchases

  Background:
    Given the customer has items in their shopping cart
    And the customer is ready to proceed to checkout

  Scenario: Shipping cost for exactly $50 total
    Given the cart total is $50
    When the customer checks out
    Then the shipping fee should be $6.99

  Scenario: Shipping cost for total of $25
    Given the cart total is $25
    When the customer checks out
    Then the shipping fee should be $4.99

  Scenario: Shipping cost for total less than $25
    Given the cart total is $20
    When the customer checks out
    Then the shipping fee should be $3.99

  Scenario: Shipping cost for total between $25 and $50
    Given the cart total is $40
    When the customer checks out
    Then the shipping fee should be $4.99

  Scenario: Shipping cost for total of $75
    Given the cart total is $75
    When the customer checks out
    Then the shipping fee should be $8.99

  Scenario: Shipping cost for total above $75 but less than or equal to $100
    Given the cart total is $90
    When the customer checks out
    Then the shipping fee should be $8.99

  Scenario: Shipping cost for total of exactly $100
    Given the cart total is $100
    When the customer checks out
    Then the shipping fee should be $10.99

  Scenario: Shipping cost for total exceeding $100
    Given the cart total is $150
    When the customer checks out
    Then the shipping fee should be $10.99

  Scenario: Shipping cost for total greater than $50 but less than or equal to $75
    Given the cart total is $55
    When the customer checks out
    Then the shipping fee should be $6.99

  Scenario: Applicable promotion when cart total exceeds $100
    Given the cart total is $150
    When the customer checks out
    Then communicate any applicable promotions or discounts during the checkout process
