Feature: Display Insufficient Funds Error

  As a customer attempting to purchase items
  I want the system to validate my balance and quantity before processing a transaction
  So that I am warned when I do not have sufficient funds or selected quantity exceeds available balance

  Background:
    Given a customer has a balance of <balance>
    And the item price is <item-price>

  Scenario: Scenario 1: Insufficient Funds for Purchase
    Given the customer selects a quantity of <quantity>
    When the customer attempts to purchase the item
    Then the system should display 'Insufficient Funds'
    And the transaction should not proceed

  Scenario: Scenario 2: Sufficient Funds for Purchase
    Given the customer selects a quantity of <sufficient-quantity>
    When the customer attempts to purchase the item
    Then the transaction should proceed successfully
    And the remaining balance should be updated

  Scenario: Scenario 3: Exceeding Quantity Based on Balance
    Given the customer has a balance of <customer-balance>
    And the item price is <item-price>
    When the customer attempts to select a quantity of <selected-quantity>
    Then the system should display 'You can only buy up to {remaining quantity} of this item'
    And the transaction should not proceed

  Scenario: Scenario 4: Successful Transaction Processing
    Given the customer has sufficient balance and selected a valid quantity
    When the customer attempts to purchase the item
    Then the system processes the transaction successfully
    And the remaining balance is updated accordingly
