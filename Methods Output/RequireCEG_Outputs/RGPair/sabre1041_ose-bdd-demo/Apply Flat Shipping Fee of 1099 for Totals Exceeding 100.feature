Feature: Apply Flat Shipping Fee of $10.99 for Totals Exceeding $100

  As a customer
  I want to know the shipping costs based on my total order amount
  So that I can anticipate the final cost of my purchase

  Background:
    Given the customer has items in their shopping cart
    And the system is ready to calculate shipping fees based on the total

  Scenario: Scenario 1: Total exceeds $100
    Given the total amount of the cart is $120
    And the system has determined the standard shipping rate
    When the customer proceeds to checkout
    Then the shipping fee of $10.99 should be added to the total
    And the final total should be $130.99

  Scenario: Scenario 2: Total is exactly $100
    Given the total amount of the cart is $100
    When the customer proceeds to checkout
    Then the shipping fee of $10.99 should be added to the total
    And the final total should be $110.99

  Scenario: Scenario 3: Total is less than or equal to $100
    Given the total amount of the cart is $80
    When the customer proceeds to checkout
    Then the system should apply the defined shipping cost regulations
    And the final total should reflect the applicable shipping charges based on subtotal range

  Scenario: Scenario 4: Total is slightly over $100 with additional fees
    Given the total amount of the cart is $105
    When the customer proceeds to checkout
    Then the shipping fee of $10.99 should be added to the total
    And the final total should be $115.99

  Scenario Outline: Scenario Outline: Different total amounts
    Given the total amount of the cart is <total>
    When the customer proceeds to checkout
    Then the calculated shipping fee should be <shipping-fee>
    And the final total should be <final-total>
    Examples:
      | total | shipping-fee | final-total |
      | $50 | $5.99 | $55.99 |
      | $95 | $5.99 | $100.99 |
      | $101 | $10.99 | $111.99 |

