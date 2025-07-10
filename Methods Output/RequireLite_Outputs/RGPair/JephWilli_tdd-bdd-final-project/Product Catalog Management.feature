Feature: Product Catalog Management

  As a store owner
  I want to efficiently manage products in a catalog
  So that I can ensure the availability and accuracy of product offerings

  Background:
    Given the product catalog management system is operational
    And the store owner is logged into the system

  Scenario: Scenario 1: Add a new product
    Given the store owner enters valid product details including name, category, price, and availability
    When the store owner submits the product creation form
    Then the product should be added to the catalog
    And the system should display a confirmation message indicating the product was successfully added

  Scenario: Scenario 2: Update an existing product
    Given the store owner selects an existing product from the catalog
    When the store owner modifies the product details to valid values and submits the updates
    Then the product details should be updated in the catalog
    And the system should display a confirmation message indicating the product was successfully updated

  Scenario: Scenario 3: Delete a product
    Given the store owner selects a product to delete
    When the store owner confirms the deletion
    Then the product should be removed from the catalog
    And the system should confirm the deletion with an appropriate message

  Scenario Outline: Scenario Outline: Search for products
    Given the store owner is on the product management page
    When the store owner executes the search
    Then the displayed products should match the criteria provided
    And the store owner can further filter products by <category> and <availability>
    Examples:
      | category | availability |
      | Electronics | Available |
      | Apparel | Not Available |
      | Grocery | Available |

