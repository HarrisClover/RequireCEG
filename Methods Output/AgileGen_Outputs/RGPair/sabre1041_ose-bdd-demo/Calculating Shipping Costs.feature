Feature: Calculating Shipping Costs

  As a store owner,
  I want to apply different shipping rates based on the total price of the items in the shopping cart
  So that I can appropriately charge customers for shipping based on their cart total

  Scenario Outline: Calculate shipping cost based on cart total
    Given that the cart total is <cart-total>
    When the shipping cost is calculated
    Then the shipping cost should be <shipping-cost>

  Examples:
    | cart-total | shipping-cost |
    | $0         | $3.99         |
    | $25        | $4.99         |
    | $50        | $6.99         |
    | $75        | $8.99         |
    | $100       | $10.99        |
    | $150       | $10.99        |
    | $200       | $10.99        |
