Feature: Calculate Shipping for Cart Total = $75

  As a store owner
  I want to ensure that the correct shipping costs are applied automatically when the cart total is $75
  So that customers have transparency and clarity about their total charges at checkout

  Background:
    Given the cart contains items totaling $75
    And the customer is logged into the system

  Scenario: Scenario 1: Shipping Cost Applied for Exact Cart Total
    Given the shopping cart total is exactly $75
    When the customer proceeds to checkout
    Then the system shall apply a shipping cost of $8.99
    And the total cost must reflect this shipping charge

  Scenario: Scenario 2: Promotions Applied at Checkout
    Given the customer has items in their cart totaling more than $75
    When the total is adjusted down to $75 due to item removal
    Then the system shall still apply a shipping cost of $8.99
    And the system must check for any promotions that can be applied

  Scenario: Scenario 3: Shipping Cost Visibility After Adjustment
    Given the shopping cart total was adjusted to $75 from a different amount
    When the customer checks the updated cart total
    Then all adjustments to the total and shipping costs are made visible to the user in real-time

  Scenario Outline: Scenario Outline: Cart Total Adjustments
    Given the customer adds items to reach a total of <cart-total>
    And the minimum for free shipping is $<min-shipping>
    When the customer removes an item worth <item-value>
    Then if the total becomes exactly $75, the shipping cost should be $8.99
    Examples:
      | cart-total | min-shipping | item-value |
      | $75 | 75 | $20 |
      | $85 | 75 | $10 |
      | $100 | 75 | $25 |

