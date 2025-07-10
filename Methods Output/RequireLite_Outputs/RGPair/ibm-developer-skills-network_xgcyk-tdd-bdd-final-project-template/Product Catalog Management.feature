Feature: Product Catalog Management

  As a store owner
  I want to manage product information efficiently
  So that I can provide a seamless shopping experience for my customers

  Background:
    Given the system is operational
    And the home page is titled 'Product Catalog Administration'

  Scenario: Scenario 1: Create a Product
    Given the user is logged into the Product Catalog Administration
    When the user inputs the product details including valid name, description, availability status, category, and price
    Then the product should be successfully created
    And the system displays a 'Success' message and clears all input fields

  Scenario: Scenario 2: Retrieve Product Details
    Given the user has a unique ID of a product
    When the user pastes the ID into the designated field and presses the retrieve button
    Then the system must display the associated product information correctly in the respective fields

  Scenario Outline: Scenario Outline: Validate Product Creation
    Given the user inputs a product with <name>, <description>, <availability>, <category>, and <price>
    When the user submits the product creation form
    Then the system returns a 'Success' message indicating that <name> has been created
    Examples:

