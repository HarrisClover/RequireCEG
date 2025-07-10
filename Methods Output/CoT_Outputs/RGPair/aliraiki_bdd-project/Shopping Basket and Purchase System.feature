Feature: Shopping Basket and Purchase System
  As a user,
  I want to add items to my basket and be informed about my balance and quantity limitations,
  So that I can make informed purchases without exceeding my funds.

  Scenario: User adds items to the basket and checks remaining balance
    Given that the user has a balance of <balance>
    When the user adds <quantity> of <item> to their basket
    Then the system should update the remaining balance
    And the total price for <quantity> <item> should be displayed as <total-price>

  Scenario: Insufficient funds for a purchase
    Given that the user has a balance of <balance>
    When the user tries to add <quantity> of <item> to their basket
    And the total price exceeds their balance
    Then the system should show an error message saying "Insufficient funds"

  Scenario: Catalog displays up to 10 affordable items
    Given that the user has a balance of <balance>
    When the user views the catalog
    Then only items within the user's budget should be displayed
    And the catalog should show up to 10 items per page

  Scenario: No available items in the catalog
    Given that the user has a balance of <balance>
    When the user views the catalog
    Then the system should display a message saying "No items available within your budget"

  Scenario: User selects a quantity within the allowed range
    Given that the user has a balance of <balance>
    When the user selects a quantity of <quantity> for <item>
    Then the system should ensure the quantity is between 1 and 10

  Scenario: Product description is truncated if it's too long
    Given that the product description for <item> is too long
    When the user views the item
    Then the description should be truncated to 50 characters with an ellipsis

  Scenario: User navigates through pages in the catalog
    Given that the catalog has more than 10 items
    When the user views the catalog
    Then the system should display pagination controls
    And the user should be able to navigate through pages
    And the total number of available items should be visible

  Scenario: Total price calculation before checkout
    Given that the user has added <quantity> of <item> to their basket
    When the user views the basket
    Then the total price should be calculated based on the selected quantity and displayed to the user
