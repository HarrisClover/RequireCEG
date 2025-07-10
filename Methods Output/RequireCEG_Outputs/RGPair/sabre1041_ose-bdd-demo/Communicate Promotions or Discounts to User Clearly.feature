Feature: Communicate Promotions or Discounts to User Clearly

  As a store owner
  I want the system to display accurate shipping fee messages based on the total basket amount
  So that customers are informed of shipping costs and any applicable discounts

  Background:
    Given the user has items in their shopping cart
    And the user is eligible for applicable promotions

  Scenario: Scenario 1: Total is less than or equal to $25
    Given the total amount in the cart is $20
    When the user checks out
    Then the system should display a message stating that a flat shipping fee of $3.99 will be applied
    And communicate any applicable promotions clearly

  Scenario: Scenario 2: Total is exactly $25
    Given the total amount in the cart is $25
    When the user checks out
    Then the system should display a message indicating that the shipping fee increases to $4.99
    And show any applicable promotions clearly

  Scenario: Scenario 3: Total is between $25 and $50 inclusive
    Given the total amount in the cart is $30
    When the user checks out
    Then the system should affirm that the shipping cost remains at $4.99
    And communicate any promotions clearly

  Scenario: Scenario 4: Total is exactly $50
    Given the total amount in the cart is $50
    When the user checks out
    Then the system should indicate that the shipping fee increases to $6.99
    And show any applicable promotions clearly

  Scenario: Scenario 5: Total is between $50 and $75
    Given the total amount in the cart is $70
    When the user checks out
    Then the system should indicate a shipping fee of $6.99 will be applied
    And communicate any promotions clearly

  Scenario: Scenario 6: Total is exactly $75
    Given the total amount in the cart is $75
    When the user checks out
    Then the system should inform the user that the shipping cost increases to $8.99
    And show any applicable promotions clearly

  Scenario: Scenario 7: Total is between $75 and $100
    Given the total amount in the cart is $80
    When the user checks out
    Then the system should communicate a shipping fee of $8.99
    And show any applicable promotions clearly

  Scenario: Scenario 8: Total is exactly $100
    Given the total amount in the cart is $100
    When the user checks out
    Then the system should indicate that shipping cost increases to $10.99
    And communicate any applicable promotions clearly

  Scenario: Scenario 9: Total is over $100
    Given the total amount in the cart is $120
    When the user checks out
    Then the system should inform the user that the shipping cost remains at $10.99
    And show any applicable promotions clearly with the shipping fee

  Scenario: Scenario 10: Total is between $25 and $50 excluding exactly $25
    Given the total amount in the cart is $30
    When the user checks out
    Then the system should affirm that the shipping cost remains at $4.99
    And communicate applicable promotions clearly

  Scenario: Scenario 11: Total is above $75 and the shipping cost behavior
    Given the total amount in the cart is $100
    When the user checks out
    Then the system should indicate that shipping cost increases to $10.99
    And notify applicable promotions clearly
