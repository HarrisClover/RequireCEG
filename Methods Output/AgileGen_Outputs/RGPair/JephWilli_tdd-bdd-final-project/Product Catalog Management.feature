Feature: Product Catalog Management
  As a store owner,
  I want to efficiently manage the product catalog
  So that I can add, update, delete, and search products seamlessly

  Scenario: Adding a new product to the catalog
    Given I am logged into the system as a store owner
    When I add a new product with the following details:
      | Name        | Description     | Price | Availability | Category  |
      | Tea Shirt   | Cotton t-shirt  | $100  | Available    | Clothing |
    Then the product should be added to the catalog
    And the input fields should be cleared
    And I should see a success message confirming the product has been created

  Scenario: Updating an existing product
    Given I am logged into the system as a store owner
    And a product with ID 123 exists in the catalog
    When I update the product with new details:
      | Name        | Description     | Price | Availability | Category  |
      | Tea Shirt   | Cotton t-shirt  | $110  | Available    | Clothing |
    Then the product should be updated in the catalog
    And the previous name should be replaced with the new name in the search results

  Scenario: Deleting a product from the catalog
    Given I am logged into the system as a store owner
    And a product with ID 123 exists in the catalog
    When I delete the product
    Then the product should no longer appear in the catalog
    And I should see a success message confirming the product has been deleted

  Scenario: Searching for a product by name
    Given I am logged into the system as a store owner
    When I search for a product by name "Tea Shirt"
    Then I should see a list of products matching the name "Tea Shirt"

  Scenario: Searching for products by category
    Given I am logged into the system as a store owner
    When I search for products in the "Clothing" category
    Then I should see a list of products in the "Clothing" category

  Scenario: Searching for products by availability
    Given I am logged into the system as a store owner
    When I search for products with availability status "Available"
    Then I should see a list of products that are available
