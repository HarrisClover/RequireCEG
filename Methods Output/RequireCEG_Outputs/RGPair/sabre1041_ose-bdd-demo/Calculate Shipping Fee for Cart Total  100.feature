Feature: Calculate Shipping Fee for Cart Total > $100

  As a store owner
  I want to calculate the appropriate shipping fee based on the cart total
  So that I can ensure accurate shipping costs for my customers

  Background:
    Given a customer has a cart with items
    And the shipping fee structure is defined

  Scenario: Scenario 1: Cart total is less than or equal to $25
    Given the cart total is $20
    When calculating the shipping fee
    Then the shipping fee should be $3.99

  Scenario: Scenario 2: Cart total is exactly $25
    Given the cart total is $25
    When calculating the shipping fee
    Then the shipping fee should be $4.99

  Scenario: Scenario 3: Cart total is between $25 and $50
    Given the cart total is $30
    When calculating the shipping fee
    Then the shipping fee should be $4.99

  Scenario: Scenario 4: Cart total is exactly $50
    Given the cart total is $50
    When calculating the shipping fee
    Then the shipping fee should be $6.99

  Scenario: Scenario 5: Cart total is between $50 and $75
    Given the cart total is $60
    When calculating the shipping fee
    Then the shipping fee should be $6.99

  Scenario: Scenario 6: Cart total is exactly $75
    Given the cart total is $75
    When calculating the shipping fee
    Then the shipping fee should be $8.99

  Scenario: Scenario 7: Cart total is between $75 and $100
    Given the cart total is $80
    When calculating the shipping fee
    Then the shipping fee should be $8.99

  Scenario: Scenario 8: Cart total is exactly $100
    Given the cart total is $100
    When calculating the shipping fee
    Then the shipping fee should be $10.99

  Scenario: Scenario 9: Cart total exceeds $100
    Given the cart total is $150
    When calculating the shipping fee
    Then the shipping fee should be $10.99

  Scenario: Scenario 10: Cart total is between $100 and $150
    Given the cart total is $120
    When calculating the shipping fee
    Then the shipping fee should be $10.99
