Feature: Input Unique Product ID

  As a customer
  I want to retrieve product details using a unique product ID
  So that I can know the product's information before making a purchase

  Background:
    Given the product database is available
    And the user is on the product retrieval page

  Scenario: Scenario 1: Successfully retrieving product details
    Given the user inputs a valid unique product ID
    When the user presses the retrieve button
    Then the system retrieves and displays the product details (name, description, availability status, category, and price)
    And the system should display the correct product name
    And the system should display the product description

  Scenario: Scenario 2: Error message for non-existent product ID
    Given the user inputs an invalid product ID
    When the user presses the retrieve button
    Then the system displays an error message stating 'Product not found.'

  Scenario: Scenario 3: Error message for empty product ID
    Given the user inputs an empty product ID
    When the user presses the retrieve button
    Then the system prompts the user to enter a valid product ID

  Scenario: Scenario 4: Requirement for unique product ID entry
    Given the user is on the product retrieval page
    When the user inputs a valid unique product ID and an empty product ID
    Then the system prompts the user to enter a valid product ID
    And the system should not display any product details

  Scenario Outline: Scenario Outline: Product details retrieval
    Given the user inputs a valid product ID of '<product-id>'
    When the user presses the retrieve button
    Then the system displays the product name as '<product-name>'
    And the system displays the product price as '<product-price>'
    Examples:
      | product-id | product-name | product-price |
      | 123456 | Tea Shirt | $100 |
      | 789012 | Sunglasses | $135 |
      | 345678 | Cookies | $126 |

