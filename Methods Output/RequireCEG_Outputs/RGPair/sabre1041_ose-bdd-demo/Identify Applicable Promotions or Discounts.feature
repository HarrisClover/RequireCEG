Feature: Identify Applicable Promotions or Discounts

  As a store owner
  I want to determine the correct shipping fee based on cart total after applicable promotions or discounts
  So that customers are informed of any shipping fees alongside their discounts

  Background:
    Given a customer has items in their shopping cart
    And the shopping cart contains items that may qualify for discounts

  Scenario: Shipping fee based on total less than or equal to $25
    Given the total in the shopping cart is $20
    When the system evaluates the total
    Then a shipping fee of $3.99 should be displayed

  Scenario: Shipping fee when total equals exactly $25
    Given the total in the shopping cart is $25
    When the system evaluates the total
    Then a shipping fee of $4.99 should be displayed

  Scenario: Shipping fee for total greater than $25 but less than or equal to $50
    Given the total in the shopping cart is $30
    When the system evaluates the total
    Then a shipping fee of $4.99 should be displayed

  Scenario: Shipping fee when total equals exactly $50
    Given the total in the shopping cart is $50
    When the system evaluates the total
    Then a shipping fee of $6.99 should be displayed

  Scenario: Shipping fee for total greater than $50 but less than or equal to $75
    Given the total in the shopping cart is $60
    When the system evaluates the total
    Then a shipping fee of $6.99 should be displayed

  Scenario: Shipping fee when total equals exactly $75
    Given the total in the shopping cart is $75
    When the system evaluates the total
    Then a shipping fee of $8.99 should be displayed

  Scenario: Shipping fee for total above $75 up to $100
    Given the total in the shopping cart is $80
    When the system evaluates the total
    Then a shipping fee of $8.99 should be displayed

  Scenario: Shipping fee when total equals exactly $100
    Given the total in the shopping cart is $100
    When the system evaluates the total
    Then a shipping fee of $10.99 should be displayed

  Scenario: Shipping fee for total exceeding $100
    Given the total in the shopping cart is $120
    When the system evaluates the total
    Then a shipping fee of $10.99 should be displayed

  Scenario: Shipping fee when total exceeds $100 with applicable promotions
    Given the total in the shopping cart is $120
    And there are applicable promotions or discounts available
    When the system calculates the shipping fee
    Then the shipping fee should be $10.99
    And communicate any applicable promotions or discounts to the user alongside the shipping fee information.
