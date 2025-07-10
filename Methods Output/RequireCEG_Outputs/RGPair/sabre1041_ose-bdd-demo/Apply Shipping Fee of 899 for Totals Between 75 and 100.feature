Feature: Apply Shipping Fee of $8.99 for Totals Between $75 and $100

  As a customer purchasing items
  I want to understand the shipping fees based on my total purchase amount
  So that I can make informed buying decisions

  Background:
    Given the customer is logged into their account
    And the items have been added to the shopping cart

  Scenario: Scenario 1: Total is exactly $75
    Given the total price of items in the cart is $75
    When the customer proceeds to checkout
    Then the system applies a shipping fee of $8.99
    And the customer sees a message stating 'You qualify for our shipping promotion!'

  Scenario: Scenario 2: Total is between $75 and $100
    Given the total price of items in the cart is $85
    When the customer proceeds to checkout
    Then the system applies a shipping fee of $8.99
    And the customer sees a message stating 'You qualify for our shipping promotion!'

  Scenario: Scenario 3: Total is exactly $100
    Given the total price of items in the cart is $100
    When the customer proceeds to checkout
    Then the system applies a shipping fee of $10.99
    And the customer sees a message indicating 'Shipping fee updated for your order.'

  Scenario: Scenario 4: Total is less than $75
    Given the total price of items in the cart is $70
    When the customer proceeds to checkout
    Then the system does not apply a shipping fee
    And the customer sees no promotion message.

  Scenario Outline: Scenario Outline: Varying Totals for Shipping Fee
    Given the total price of items in the cart is <total>
    When the customer proceeds to checkout
    Then the system applies a shipping fee of <shipping-fee>
    And the customer sees a message indicating <message>
    Examples:
      | total | shipping-fee | message |
      | $75 | $8.99 | You qualify for our shipping promotion! |
      | $85 | $8.99 | You qualify for our shipping promotion! |
      | $100 | $10.99 | Shipping fee updated for your order. |
      | $70 | $0.00 | No promotion available. |

