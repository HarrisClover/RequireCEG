Feature: Shipping Cost Calculation

  As a store owner
  I want to calculate shipping costs based on the total price of items in the shopping cart
  So that I can ensure that customers are aware of shipping fees based on their order total

  Background:
    Given the shipping fees are established according to the total amount of items in the shopping cart
    And the following thresholds affect shipping costs: less than $25, exactly $25, between $25 and $50, exactly $50, between $50 and $75, exactly $75, between $75 and $100, exactly $100, and above $100

  Scenario: Shipping cost for total less than $25
    Given the total price of items is $20
    Then the shipping cost should be $3.99

  Scenario: Shipping cost for total exactly $25
    Given the total price of items is $25
    Then the shipping cost should be $4.99

  Scenario: Shipping cost for total between $25 and $50
    Given the total price of items is $40
    Then the shipping cost should be $4.99

  Scenario: Shipping cost for total exactly $50
    Given the total price of items is $50
    Then the shipping cost should be $6.99

  Scenario: Shipping cost for total between $50 and $75
    Given the total price of items is $60
    Then the shipping cost should be $6.99

  Scenario: Shipping cost for total exactly $75
    Given the total price of items is $75
    Then the shipping cost should be $8.99

  Scenario: Shipping cost for total between $75 and $100
    Given the total price of items is $80
    Then the shipping cost should be $8.99

  Scenario: Shipping cost for total exactly $100
    Given the total price of items is $100
    Then the shipping cost should be $10.99

  Scenario: Shipping cost for total above $100
    Given the total price of items is $150
    Then the shipping cost should be $10.99

  Scenario Outline: Shipping cost based on total
    Given the total price of items is <total_price>
    Then the shipping cost should be <shipping_cost>
    Examples:


  Scenario: Invalid total price scenarios
    Given the total price of items is -$10
    Then an error message should be displayed indicating that the amount is invalid
