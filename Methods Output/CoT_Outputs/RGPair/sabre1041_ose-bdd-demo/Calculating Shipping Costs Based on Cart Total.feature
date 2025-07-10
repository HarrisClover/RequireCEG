Feature: Calculating Shipping Costs Based on Cart Total
  As a store owner,
  I want to calculate shipping costs based on the cart total,
  So that I can provide transparent shipping fees and inform customers about promotions.

  Scenario Outline: Calculate shipping cost based on the cart total
    Given a customer is logged into the system
    And the shopping cart contains the following items:
      | Item        | Price |
      | <item1>     | <price1> |
      | <item2>     | <price2> |
      | <item3>     | <price3> |
    When the total price of the cart is calculated
    Then the shipping cost should be <shipping-cost>
    And any applicable promotions or discounts should be displayed to the customer

  Examples:
    | item1     | price1 | item2      | price2 | item3     | price3 | shipping-cost | discount |
    | Tea Shirt | 100    | Sunglasses | 135    | Cookies   | 126    | $10.99        | None     |
    | Cookies   | 50     | Tea Shirt  | 25     |           | 0      | $4.99         | None     |
    | T-shirt   | 10     | Cookies    | 15     | Sunglasses| 10     | $3.99         | None     |
    | T-shirt   | 100    | Cookies    | 40     | Sunglasses| 30     | $6.99         | 10% off  |
    | Hat       | 100    | Sunglasses | 150    | Cookies   | -50    | $10.99        | None     |
