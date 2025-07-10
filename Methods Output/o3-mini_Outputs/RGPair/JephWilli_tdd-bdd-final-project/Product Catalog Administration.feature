Feature: Product Catalog Administration
  As a product store owner,
  I want a RESTful catalog service that manages products with operations such as create, read, update, delete, list, and search,
  So that I can efficiently manage product information without errors.

  # Scenario: Create a new product and verify its details
  Scenario: Successfully create a new product
    Given the catalog service is available
    And the product creation form is displayed with a title "Product Management"
    When the store owner creates a new product with the following attributes:
      | Name        | Description               | Price  | Availability | Category    |
      | "Running Shoes" | "High quality running shoes" | "$120" | "In Stock"   | "Footwear"  |
    Then the system should display a success message "Product created successfully"
    And the input fields must be cleared after creation
    And the product details can be retrieved by its ID with the entered attributes

  # Scenario: Read/Retrieve an existing product by ID
  Scenario: Retrieve a product details using its ID
    Given a product with ID "12345" exists in the catalog
    When the store owner retrieves the product by its ID "12345"
    Then the product details should be displayed including Name, Description, Price, Availability, and Category

  # Scenario: Update an existing product's details
  Scenario: Update product details
    Given a product with ID "12345" exists in the catalog
    When the store owner updates the product's details to:
      | Name            | Description                | Price  | Availability  | Category     |
      | "Running Sneakers" | "Updated high quality sneakers" | "$150" | "Limited Stock" | "Footwear"   |
    Then the system should display a success message "Product updated successfully"
    And the updated product details should replace the previous ones in all search results

  # Scenario: Delete an existing product
  Scenario: Delete an existing product
    Given a product with ID "12345" exists in the catalog
    When the store owner deletes the product with ID "12345"
    Then the system should confirm deletion with a success message "Product deleted successfully"
    And the product with ID "12345" should no longer appear in the search results

  # Scenario: List all available products
  Scenario: List all available products
    Given the catalog service is available
    When the store owner requests to list all products
    Then the system should display a list of all products available in the catalog

  # Scenario Outline: Filter products by category and availability
  Scenario Outline: Filter products based on category and availability
    Given multiple products exist in the catalog
    When the store owner filters products with category "<Category>" and availability "<Availability>"
    Then the system should return a list of products that match the category "<Category>" and the availability "<Availability>"

    Examples:
      | Category   | Availability |
      | "Footwear" | "In Stock"   |
      | "Electronics" | "Preorder"|
