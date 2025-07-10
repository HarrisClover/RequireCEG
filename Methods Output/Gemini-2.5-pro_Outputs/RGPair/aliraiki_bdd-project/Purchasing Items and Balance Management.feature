Feature: Purchasing Items and Balance Management
  As a user
  I want to buy items and have my balance updated correctly
  So that I can manage my purchases and available funds effectively.

  Scenario: Successfully purchasing an affordable item
    Given the user has a balance of $100
    And the user is viewing an item "Cool Widget" priced at $50
    When the user clicks the "Buy" symbol for "Cool Widget"
    Then the item "Cool Widget" should be added to the user's purchased items list
    And the user's balance should be updated to $50

  Scenario: Attempting to purchase an unaffordable item
    Given the user has a balance of $30
    And the user is viewing an item "Expensive Gadget" priced at $75
    When the user clicks the "Buy" symbol for "Expensive Gadget"
    Then the purchase should fail
    And the user should see an "Insufficient funds" error message
    And the user's balance should remain $30
    And the item "Expensive Gadget" should not be added to the user's purchased items list

