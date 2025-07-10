Feature: Verify Accuracy of Retrieved Information

  As a user
  I want to retrieve product details using a unique ID
  So that I can ensure that the product information is accurate and up-to-date

  Background:
    Given the user is on the product retrieval interface
    And the system contains a database of products

  Scenario: Scenario 1: Successful product retrieval
    Given the unique ID '123' corresponds to an existing product in the database
    When the user inputs the unique ID and presses the retrieve button
    Then the name field should display the product name
    And the description field should display the product description
    And the availability status field should indicate the product's availability
    And the category field should display the product category
    And the price field should show the product price
    And a confirmation message 'Product details successfully retrieved.' should be shown

  Scenario: Scenario 2: Product not found
    Given the unique ID '999' does not correspond to any product in the database
    When the user inputs the unique ID and presses the retrieve button
    Then the system should present a 'Product not found' message

  Scenario: Scenario 3: Validation of empty name field
    Given the unique ID '124' corresponds to a product with an empty name field
    When the user inputs the unique ID and presses the retrieve button
    Then the system should display an error message 'Name cannot be empty'

  Scenario: Scenario 4: Validation of negative price
    Given the unique ID '125' corresponds to a product with a negative price
    When the user inputs the unique ID and presses the retrieve button
    Then the system should display an error message 'Price must be a non-negative value'

  Scenario: Scenario 5: Validation of undefined availability status
    Given the unique ID '126' corresponds to a product with availability status 'undefined'
    When the user inputs the unique ID and presses the retrieve button
    Then the system should display an error message 'Availability status is not clearly defined.'

  Scenario Outline: Scenario Outline: Validation of availability status
    Given the unique ID '<product-id>' corresponds to a product with availability status '<availability-status>'
    When the user inputs the unique ID and presses the retrieve button
    Then the system should display an error message 'Availability status is not clearly defined.'
    Examples:
      | product-id | availability-status |
      | 127 |  |
      | 128 | undefined |

