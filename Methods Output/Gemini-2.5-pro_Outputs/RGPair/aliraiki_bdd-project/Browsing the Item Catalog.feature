Feature: Browsing the Item Catalog
  As a user
  I want to browse available items filtered by affordability and displayed clearly with pagination
  So that I can easily find products I can purchase within my budget.

  Scenario: Viewing affordable items in the catalog
    Given the user has a balance of $150
    And the system has the following items available:
      | Item Name        | Price |
      | Cheap Trinket    | $20   |
      | Mid-Range Item   | $100  |
      | Premium Product  | $200  |
      | Affordable Gadget| $140  |
    When the user views the item catalog
    Then the catalog should display the following items:
      | Item Name        | Price |
      | Cheap Trinket    | $20   |
      | Mid-Range Item   | $100  |
      | Affordable Gadget| $140  |
    And the catalog should not display "Premium Product"

  Scenario: Catalog displays a maximum of 10 items per page
    Given the user has a balance of $1000
    And the system has 15 affordable items available for the user
    When the user views the first page of the item catalog
    Then the catalog should display exactly 10 items

  Scenario: Notification when no affordable items are available
    Given the user has a balance of $10
    And the system only has items priced $20 or more
    When the user views the item catalog
    Then the user should see a notification indicating "No items available within your budget."

  Scenario: Notification when the catalog is completely empty
    Given the user has a balance of $100
    And the system has no items available at all
    When the user views the item catalog
    Then the user should see a notification indicating "No items available at this time."