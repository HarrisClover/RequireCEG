Feature: Calculate Shipping for Cart Total > $75 and <= $100

  As a store owner
  I want to calculate shipping costs based on cart total
  So that customers are aware of shipping charges during checkout

  Background:
    Given a customer has items in their cart
    And the items' total value is calculated

  Scenario: Scenario 1: Total exceeds $75 but less than or equal to $100
    Given the cart total is $80
    When the customer proceeds to checkout
    Then the shipping cost should be $8.99
    And the customer should see a summary of their total including shipping

  Scenario: Scenario 2: Total is exactly $100
    Given the cart total is $100
    When the customer proceeds to checkout
    Then the shipping cost should be $10.99
    And the customer should see a summary of their total including shipping

  Scenario: Scenario 3: Total exceeds $100
    Given the cart total is $150
    When the customer proceeds to checkout
    Then the shipping cost should be $10.99
    And the customer should see a summary of their total including shipping

  Scenario: Scenario 4: No active promotions or discounts
    Given the cart total is $90
    And there are no active promotions or discounts applicable
    When the customer proceeds to checkout
    Then the shipping cost should be $8.99
    And the customer should see a message indicating no promotions or discounts are applicable

  Scenario: Scenario 5: Active promotions or discounts available
    Given the cart total is $85
    And there are active promotions or discounts applicable
    When the customer proceeds to checkout
    Then the shipping cost should be $8.99
    And the customer should see details of applicable promotions or discounts

  Scenario Outline: Scenario Outline: Shipping Cost Based on Cart Total
    Given the cart total is <cart-total>
    When the customer proceeds to checkout
    Then the shipping cost should be <shipping-cost>
    Examples:
      | cart-total | shipping-cost |
      | $80 | $8.99 |
      | $100 | $10.99 |
      | $110 | $10.99 |
      | $95 | $8.99 |

