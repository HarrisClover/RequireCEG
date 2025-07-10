Feature: Purchase Management System

  As a customer
  I want to buy articles and manage my basket effectively
  So that I can purchase items without exceeding my budget

  Background:
    Given the user has a valid account
    And the user has sufficient funds available

  Scenario: Scenario 1: Add item to basket
    Given the user is on the catalog page
    When the user clicks on the Buy symbol for 'Tea Shirt'
    Then the item is added to the basket
    And the system verifies the user does not exceed their budget

  Scenario: Scenario 2: Insufficient funds
    Given the user has $100 in their account
    When the user tries to buy an item costing $150
    Then the system should inform the user of insufficient funds

  Scenario: Scenario 3: Exact funds available
    Given the user has $50 in their account
    When the user attempts to buy an item costing $50
    Then the item is added to the basket
    And the user's balance is now $0

  Scenario Outline: Scenario Outline: Manage articles in basket
    Given the user has selected <quantity> of '<article>'
    When the user attempts to purchase the selected articles
    Then the total price displayed should be <totalPrice>
    And the current balance is <updatedBalance>
    Examples:
      | quantity | article | balance | totalPrice | updatedBalance |
      | 1 | Sunglasses | $200 | $135 | $65 |
      | 5 | Cookies | $500 | $630 | $-130 |
      | 3 | Tea Shirt | $600 | $300 | $300 |
      | 2 | Novel | $100 | $40 | $60 |

