Feature: Shipping Fee Calculation

  As a store owner
  I want to ensure the correct shipping fees are applied based on the total price of items in the basket
  So that customers are accurately informed of their shipping costs

  Background:
    Given the customer has items in their shopping cart
    And the total price of items is calculated

  Scenario: Scenario 1: Total price is less than $25
    Given the total price is $20
    Then the shipping fee should be $3.99
    And the user should be notified of the shipping cost

  Scenario: Scenario 2: Total price is exactly $25
    Given the total price is exactly $25
    Then the shipping fee should be $4.99
    And the user should be notified of the shipping adjustment

  Scenario: Scenario 3: Total price is between $25 and $50
    Given the total price is $30
    Then the shipping fee should be $4.99
    And the user should be notified of the shipping cost

  Scenario: Scenario 4: Total price is exactly $50
    Given the total price is exactly $50
    Then the shipping fee should be $6.99
    And the user should be notified of the shipping adjustment

  Scenario: Scenario 5: Total price is between $50 and $75
    Given the total price is $60
    Then the shipping fee should be $6.99
    And the user should be notified of the shipping cost

  Scenario: Scenario 6: Total price is exactly $75
    Given the total price is exactly $75
    Then the shipping fee should be $8.99
    And the user should be notified of the shipping adjustment

  Scenario: Scenario 7: Total price is between $75 and $100
    Given the total price is $80
    Then the shipping fee should be $8.99
    And the user should be notified of the shipping cost

  Scenario: Scenario 8: Total price is exactly $100
    Given the total price is exactly $100
    Then the shipping fee should be $10.99
    And the user should be notified of the shipping adjustment

  Scenario: Scenario 9: Total price is greater than $100
    Given the total price is $150
    Then the shipping fee should be $10.99
    And the user should be notified of the shipping cost

  Scenario: Scenario 10: Shipping fee cannot be lower than $3.99
    Given the total price is $15
    Then the shipping fee should be $3.99
    And the user should be notified of the shipping cost

  Scenario: Scenario 11: Each tier of shipping must align with its price range
    Given the total price is exactly $45
    Then the shipping fee must be $4.99
    And the user should be notified with the correct shipping amount
