Feature: Calculate Shipping for Cart Total = $25

  As a store owner
  I want to ensure accurate shipping fees based on the cart total
  So that customers have a clear understanding of their costs during checkout

  Background:
    Given a cart total amount
    And the store's shipping fee policy is in effect

  Scenario: Scenario 1: Total equals $25
    Given the cart total is $25
    When the customer proceeds to checkout
    Then the shipping fee should be $4.99

  Scenario: Scenario 2: Total is less than $25
    Given the cart total is $20
    When the customer proceeds to checkout
    Then the shipping fee should be $3.99

  Scenario: Scenario 3: Total exceeds $25 but less than or equal to $50
    Given the cart total is $30
    When the customer proceeds to checkout
    Then the shipping fee should be $4.99

  Scenario: Scenario 4: Total equals $50
    Given the cart total is $50
    When the customer proceeds to checkout
    Then the shipping fee should be $6.99

  Scenario: Scenario 5: Total exceeds $50 but less than or equal to $75
    Given the cart total is $60
    When the customer proceeds to checkout
    Then the shipping fee should be $6.99

  Scenario: Scenario 6: Total equals $75
    Given the cart total is $75
    When the customer proceeds to checkout
    Then the shipping fee should be $8.99

  Scenario: Scenario 7: Total exceeds $75 but less than or equal to $100
    Given the cart total is $90
    When the customer proceeds to checkout
    Then the shipping fee should be $8.99

  Scenario: Scenario 8: Total equals $100
    Given the cart total is $100
    When the customer proceeds to checkout
    Then the shipping fee should be $10.99

  Scenario: Scenario 9: Total exceeds $100
    Given the cart total is $150
    When the customer proceeds to checkout
    Then the shipping fee should be $10.99

  Scenario: Scenario 10: Total equals $75 with promotions or discounts
    Given the cart total is $75
    When the customer proceeds to checkout
    Then the shipping fee should be $8.99
    And the customer should receive applicable promotions or discounts

  Scenario: Scenario 11: Total is less than $25 without promotions
    Given the cart total is $20
    When the customer proceeds to checkout
    Then the shipping fee should be $3.99
    And the customer should not receive promotions or discounts
