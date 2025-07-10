Feature: Calculate Shipping for Cart Total > $25 and <= $50

  As a customer
  I want to know the applicable shipping fee based on my cart total
  So that I can understand any additional costs before finalizing my purchase

  Background:
    Given that there are predefined shipping fee thresholds
    And that promotions or discounts will be considered during the calculation

  Scenario: Shipping fee for cart total exactly $25
    Given a customer has a cart total of $25
    When calculating the shipping fee
    Then the shipping fee should be $4.99

  Scenario: Shipping fee for cart total greater than $25 and less than or equal to $50
    Given a customer has a cart total of $30
    When calculating the shipping fee
    Then the shipping fee should be $4.99

  Scenario: Shipping fee for cart total exactly $50
    Given a customer has a cart total of $50
    When calculating the shipping fee
    Then the shipping fee should be $6.99

  Scenario: Shipping fee for cart total less than or equal to $25 with no promotions
    Given a customer has a cart total of $20
    And no promotions or discounts applied
    When calculating the shipping fee
    Then the shipping fee should be $6.99

  Scenario: Shipping fee based on promotions for a cart total > $25 and <= $50
    Given a customer has a cart total of $40
    And promotions or discounts are applied
    When calculating the shipping fee
    Then the shipping fee should be $4.99

  Scenario Outline: Shipping fee for various cart totals
    Given a customer has a cart total <cart-total>
    When calculating the shipping fee
    Then the shipping fee should be <shipping-fee>
    Examples:
      | cart-total | shipping-fee |
      | $25 | $4.99 |
      | $30 | $4.99 |
      | $50 | $6.99 |
      | $45 | $4.99 |
      | $26 | $4.99 |

