Feature: Calculate Shipping Cost Based on Cart Total
As a store owner,
I want the system to calculate shipping costs based on the total price of items in the shopping cart
So that customers are charged correctly and informed of any applicable promotions or discounts

Scenario Outline: Determine the correct shipping fee for a given cart total
Given a shopping cart with a total price of <total-price>
When the system calculates the shipping cost
Then the shipping fee should be <shipping-fee>

Examples:
| total-price | shipping-fee |
| $10 | $3.99 | # For totals less than $25, a flat fee of $3.99 is applied
| $25 | $4.99 | # For a total exactly $25, the fee increases to $4.99
| $30 | $4.99 | # For totals between $25 and $50, the shipping cost remains $4.99
| $50 | $6.99 | # For a total exactly $50, the fee rises to $6.99
| $60 | $6.99 | # For totals more than $50 but less than or equal to $75, the fee is $6.99
| $75 | $8.99 | # For a total exactly $75, the fee increases to $8.99
| $80 | $8.99 | # For totals above $75 up to $100, the fee is $8.99
| $100 | $10.99 | # For a total exactly $100, the fee becomes $10.99
| $110 | $10.99 | # For totals exceeding $100, the fee remains $10.99

Scenario: Display applicable promotions and discounts
Given a shopping cart with items and any applicable promotions or discounts
When the system calculates the shipping cost and discounts
Then the system shall clearly communicate any available promotions or discount details to the user