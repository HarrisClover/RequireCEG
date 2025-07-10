Feature: Calculate Shipping for Cart Total > $50 and <= $75

  As a store owner
  I want to calculate shipping fees based on cart total
  So that customers are informed of shipping costs before finalizing their orders

  Background:
    Given a customer has items in their cart
    And the items have a total value calculated

  Scenario: Scenario 1: Total between $50 and $75
    Given the cart total is $60
    When calculating the shipping fee
    Then the shipping fee should be $6.99

  Scenario: Scenario 2: Total exactly $75
    Given the cart total is $75
    When calculating the shipping fee
    Then the shipping fee should be $8.99

  Scenario: Scenario 3: Total between $75 and $100
    Given the cart total is $80
    When calculating the shipping fee
    Then the shipping fee should be $8.99

  Scenario: Scenario 4: Total exactly $100
    Given the cart total is $100
    When calculating the shipping fee
    Then the shipping fee should be $10.99
    And the conditions are met for the shipping cost increase

  Scenario: Scenario 5: Total exceeding $100
    Given the cart total is $150
    When calculating the shipping fee
    Then the shipping fee should be $10.99
    And the conditions for exceeding the total are satisfied

  Scenario: Scenario 6: Ensure non-existence of promotional discounts
    Given the customer does not have any promotional discounts
    When calculating the shipping fee
    Then the shipping fee should still apply without additional discounts
