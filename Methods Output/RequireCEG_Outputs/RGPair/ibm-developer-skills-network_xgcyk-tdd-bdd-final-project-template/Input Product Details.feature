Feature: Input Product Details

  As a Product Store Owner
  I want to input product details into the system
  So that I can successfully add products to the store

  Background:
    Given the Product Store Owner is on the product input page
    And all required fields are visible

  Scenario: Scenario 1: Successful product addition
    Given the Product Store Owner fills in the product name, description, availability status, category, and price
    When the Product Store Owner submits the form
    Then the product will be created in the database
    And a 'Success' message will be displayed

  Scenario: Scenario 2: Missing required fields
    Given the Product Store Owner leaves the product name field empty
    When the Product Store Owner submits the form
    Then the system will prompt the user to fill in the missing product name
    And an error message indicating that the product name is required will be displayed

  Scenario: Scenario 2: Missing required fields - multiple fields
    Given the Product Store Owner leaves one or more required fields (description, availability status) empty
    When the Product Store Owner submits the form
    Then the system will prompt the user to fill in the missing product description and availability status
    And an error message indicating that the product description and availability status are required will be displayed

  Scenario: Scenario 3: Retrieve product by ID - found
    Given the Product Store Owner inputs a unique product ID
    When the Product Store Owner presses the retrieve button
    Then if a matching product is found, the system will display the associated product information
    And no error message will be shown

  Scenario: Scenario 3: Retrieve product by ID - not found
    Given the Product Store Owner inputs a non-existing product ID
    When the Product Store Owner presses the retrieve button
    Then the system will present an error message indicating that the product was not found

  Scenario: Scenario 4: Check retrieval without product ID
    Given the Product Store Owner does not input a product ID
    When the Product Store Owner presses the retrieve button
    Then the system will prompt the user to enter a product ID
    And indicate that the product ID is required for retrieval
