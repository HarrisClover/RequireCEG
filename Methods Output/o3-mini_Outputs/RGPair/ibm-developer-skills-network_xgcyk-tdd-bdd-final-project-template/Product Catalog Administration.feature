Feature: Product Catalog Administration

  As a product store owner,
  I want to manage product information efficiently
  So that I can create, view, and retrieve product details without errors

  Scenario: Display Home Page
    Given the Product Store Service is running
    When the user navigates to the home page
    Then the page title should be "Product Catalog Administration"
    And the page should load without a "404 Not Found" error

  Scenario: Create a New Product Successfully
    Given the user is on the "Product Catalog Administration" home page
    When the user enters the product details:
      | Field          | Value                   |
      | Name           | "Example Product"       |
      | Description    | "A sample description"  |
      | Availability   | "In Stock"              |
      | Category       | "Sample Category"       |
      | Price          | "$99.99"                |
    And the user submits the product creation form
    Then the system should display a "Success" message
    And all input fields should be cleared

  Scenario: Retrieve Product Details by Unique ID
    Given the user is on the "Product Catalog Administration" home page
    And a product with unique ID "12345" exists with the following details:
      | Field          | Expected Value          |
      | Name           | "Example Product"       |
      | Description    | "A sample description"  |
      | Availability   | "In Stock"              |
      | Category       | "Sample Category"       |
      | Price          | "$99.99"                |
    When the user enters the unique ID "12345" into the retrieval field
    And the user presses the retrieve button
    Then the system should display the product details in their respective fields
    And the fields should be populated with the correct product information
