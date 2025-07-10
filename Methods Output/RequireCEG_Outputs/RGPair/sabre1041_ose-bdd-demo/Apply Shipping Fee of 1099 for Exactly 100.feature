Feature: Apply Shipping Fee of $10.99 for Exactly $100

  As a customer
  I want to know the shipping fee applied to my order
  So that I can understand the full cost before checkout

  Background:
    Given the shipping fee policy is in place
    And the customer has items in their shopping cart

  Scenario: Scenario 1: Total is exactly $100
    Given the customer has a total cart value of $100
    When the checkout process is initiated
    Then the system applies a shipping fee of $10.99
    And the customer is informed of the shipping fee

  Scenario: Scenario 2: Total exceeds $100
    Given the customer has a total cart value exceeding $100
    When the checkout process is initiated
    Then the system determines the shipping fee based on predefined tiered shipping rates
    And the customer is informed of the determined shipping fee

  Scenario: Scenario 3: Total is less than $100
    Given the customer has a total cart value of less than $100
    When the checkout process is initiated
    Then the system applies tiered shipping rates based on total
    And the customer is informed of the tiered shipping fee

  Scenario: Scenario 4: Promotions or Discounts Applied
    Given the customer has a total cart value exceeding $100
    And there are applicable promotions or discounts
    When the checkout process is initiated
    Then the system displays any applicable promotions or discounts prominently
    And the customer is informed of the promotional discounts

  Scenario Outline: Scenario Outline: Shipping Fee Calculation Based on Total
    Given the customer has a total cart value of <cart-total>
    When the checkout process is initiated
    Then the shipping fee applied will be <shipping-fee>
    Examples:
      | cart-total | shipping-fee |
      | $50 | $5.99 |
      | $75 | $7.99 |
      | $99 | $9.99 |

