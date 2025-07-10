Feature: Notify User if No Items Available

  As a customer of the store
  I want to know when items are not available for purchase
  So that I can manage my expectations and decide how to proceed with my shopping

  Background:
    Given the store catalog contains items
    And the customer has an account with a balance

  Scenario: Scenario 1: Insufficient Account Balance
    Given the customer's account balance is less than the price of the cheapest item
    When the customer attempts to view items in the catalog
    Then the system should notify the user with 'You cannot afford any items at this time.'

  Scenario: Scenario 2: Empty Catalog
    Given the store catalog is empty
    When the customer tries to add items to their cart
    Then the system should show a notification stating 'The catalog is currently empty.'

  Scenario: Scenario 3: User Balance Insufficient to View Items
    Given the customer's account balance is insufficient to view items
    When the customer attempts to view items in the catalog
    Then the system should display the message 'You cannot afford any items at this time.'

  Scenario: Scenario 4: User's Balance Sufficient to View Items
    Given the customer's account balance is sufficient to afford at least one item
    And the catalog is not empty
    When the customer attempts to view items in the catalog
    Then the system should present items within the user's budget for viewing.

  Scenario Outline: Scenario Outline: Insufficient Balance with Items Available
    Given the customer's account balance is below the minimum price in the catalog
    And the catalog contains items priced higher than the balance
    When the customer attempts to view items
    Then the system should inform the user about their insufficient balance
    Examples:
      | balance | cheapest_item_price | outcome |
      | $50 | $100 | 'You cannot afford any items at this time.' |
      | $80 | $90 | 'You cannot afford any items at this time.' |

