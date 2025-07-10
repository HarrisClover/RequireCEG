Feature: Apply Shipping Fee of $4.99 for Exactly $25

  As a store owner
  I want to apply specific shipping fees based on the subtotal
  So that customers are informed of shipping costs accurately according to their cart totals

  Background:
    Given the customer has items in their shopping cart
    And the shopping cart subtotal is determined

  Scenario: Scenario 1: Subtotal equals $25
    Given the subtotal of the shopping cart is $25
    When the customer proceeds to checkout
    Then the shipping fee should be $4.99
    And the message should inform the customer of the $4.99 shipping fee for a $25 subtotal

  Scenario: Scenario 2: Subtotal less than $25
    Given the subtotal of the shopping cart is $20
    When the customer proceeds to checkout
    Then the shipping fee should be $3.99
    And the message should inform the customer of the $3.99 shipping fee for subtotals less than $25

  Scenario: Scenario 3: Subtotal greater than $25 but less than or equal to $50
    Given the subtotal of the shopping cart is 40
    When the customer proceeds to checkout
    Then the shipping fee should be $4.99
    And the message should inform the customer of the $4.99 shipping fee for subtotals greater than $25 and less than or equal to $50

  Scenario: Scenario 4: Subtotal equals $50
    Given the subtotal of the shopping cart is $50
    When the customer proceeds to checkout
    Then the shipping fee should be $6.99
    And the message should inform the customer of the $6.99 shipping fee for a $50 subtotal

  Scenario: Scenario 5: Subtotal greater than $50 but less than $75
    Given the subtotal of the shopping cart is $60
    When the customer proceeds to checkout
    Then the shipping fee should be $6.99
    And the message should inform the customer of the $6.99 shipping fee for subtotals greater than $50 but less than $75

  Scenario: Scenario 6: Subtotal equals $75
    Given the subtotal of the shopping cart is $75
    When the customer proceeds to checkout
    Then the shipping fee should be $8.99
    And the message should inform the customer of the $8.99 shipping fee for a $75 subtotal

  Scenario: Scenario 7: Subtotal greater than $75 but less than $100
    Given the subtotal of the shopping cart is $80
    When the customer proceeds to checkout
    Then the shipping fee should be $8.99
    And the message should inform the customer of the $8.99 shipping fee for subtotals greater than $75 but less than $100

  Scenario: Scenario 8: Subtotal equals $100
    Given the subtotal of the shopping cart is $100
    When the customer proceeds to checkout
    Then the shipping fee should be $10.99
    And the message should inform the customer of the $10.99 shipping fee for a $100 subtotal

  Scenario: Scenario 9: Subtotal greater than $100
    Given the subtotal of the shopping cart is $120
    When the customer proceeds to checkout
    Then the shipping fee should be $10.99
    And the message should inform the customer of the $10.99 shipping fee for subtotals exceeding $100

  Scenario: Scenario 10: Subtotal equals $25 and $50 can't occur
    Given the subtotal of the shopping cart is $25
    When the customer checks the subtotal
    Then it should not be equal to $50
