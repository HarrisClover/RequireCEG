Feature: Ensure Seamless Functionality Without 404 Errors

  As a product catalog manager
  I want to prevent 404 errors for product access
  So that users can browse products without disruption

  Background:
    Given the product catalog is up and running
    And the database is populated with products

  Scenario: Scenario 1: Viewing existing product by ID
    Given a user requests to view a product with an existing ID
    When the system retrieves the product details
    Then the product information is displayed
    And no 404 error occurs

  Scenario: Scenario 2: Viewing deleted product by ID
    Given a user requests to view a deleted product by its ID
    When the system checks the product ID
    Then the system informs the user that the product has been removed
    And suggests searching for other products

  Scenario: Scenario 3: Selecting a product category with available products
    Given a user selects a product category
    When the system retrieves the products in that category
    Then available products are displayed
    And no 404 error occurs

  Scenario: Scenario 4: Selecting a product category with no products
    Given a user selects a product category with no products
    When the system checks for products in the category
    Then the system informs the user that no products are available
    And no 404 error occurs

  Scenario: Scenario 5: Updating product details
    Given a user updates a product's details
    When the system saves the new product information
    Then the old product details are not accessible in search results
    And ensure that old product details are no longer accessible in search results

  Scenario: Scenario 6: Ensuring correct display of product details when product ID exists
    Given a user requests to view a product with an existing ID
    When the system retrieves the product details
    Then display the correct product details
