Feature: Selecting Item Quantity
  As a user
  I want to select the quantity of an item I wish to buy and see the total cost
  So that I can purchase multiple units and understand the total price before buying.

  Scenario Outline: Selecting a valid quantity updates the total price
    Given the user is viewing the product page for "Sample Item" priced at $<price>
    When the user selects a quantity of <quantity>
    Then the displayed total price for the selection should be $<total_price>

    Examples:
      | price | quantity | total_price |
      | $25   | 1        | $25         |
      | $25   | 3        | $75         |
      | $10   | 10       | $100        |

  Scenario: Attempting to select quantity below the minimum limit
    Given the user is viewing the product page for "Sample Item"
    And the current selected quantity is 1
    When the user attempts to decrease the quantity below 1
    Then the quantity should remain 1

  Scenario: Attempting to select quantity above the maximum limit
    Given the user is viewing the product page for "Sample Item"
    And the current selected quantity is 10
    When the user attempts to increase the quantity above 10
    Then the quantity should remain 10

