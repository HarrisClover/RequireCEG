Feature: Product Catalog Administration
  As a product store owner,
  I want to manage product information efficiently,
  So that I can ensure accurate and up-to-date product listings.

  Scenario: Display the home page
    Given the user is logged into the system
    When the user navigates to the product catalog page
    Then the page title should be "Product Catalog Administration"
    And the page should be accessible without a "404 Not Found" error

  Scenario: Create a new product
    Given the user is on the "Create Product" page
    When the user inputs product details:
      | Name           | Description   | Availability Status | Category | Price  |
      | T-shirt        | Cotton shirt  | Available           | Apparel  | $20.00 |
    And the user clicks the "Create" button
    Then the system should display a "Success" message
    And all input fields should be cleared

  Scenario: Retrieve product details
    Given the user is on the "Product Details" page
    When the user enters the product unique ID into the retrieve field
    And the user presses the "Retrieve" button
    Then the system should display the correct product information:
      | Name      | Description   | Availability Status | Category | Price  |
      | T-shirt   | Cotton shirt  | Available           | Apparel  | $20.00 |
