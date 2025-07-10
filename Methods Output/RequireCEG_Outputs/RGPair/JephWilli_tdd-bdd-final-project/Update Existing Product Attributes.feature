Feature: Update Existing Product Attributes

  As a store manager
  I want to update existing product attributes
  So that I can ensure the catalog reflects the most accurate and up-to-date information

  Background:
    Given the product ID is valid
    And all required attributes (name, description, price, availability, category) are provided correctly

  Scenario: Scenario 1: Successful Product Update
    Given the product attributes to update are provided
    When the store manager submits the update request
    Then a success message indicating the update was successful should be displayed
    And the catalog should reflect the updated product details

  Scenario: Scenario 2: Update with Duplicate Product Name
    Given the new product name already exists in the catalog
    When the store manager attempts to update the product
    Then the system should prompt for confirmation to proceed with the name change

  Scenario: Scenario 3: Invalid Product ID Update
    Given the product ID is invalid
    When the store manager tries to update the product
    Then an error message outlining the invalid product ID should be displayed

  Scenario: Scenario 4: Missing Required Attributes
    Given the product ID is valid
    And the required attribute 'name' is missing
    When the store manager attempts to update the product
    Then an error message indicating the missing 'name' should be displayed

  Scenario: Scenario 5: Update Product to Unavailable
    Given the product ID is valid
    When the store manager updates the product to be marked as unavailable
    Then the product should be removed from the available products list

  Scenario: Scenario 6: Update with Missing Attributes
    Given the product ID is valid
    And the required attribute 'description' is missing
    When the store manager attempts to update the product
    Then an error message indicating the missing 'description' should be displayed

  Scenario: Scenario 7: Update with Missing Price
    Given the product ID is valid
    And the required attribute 'price' is missing
    When the store manager attempts to update the product
    Then an error message indicating the missing 'price' should be displayed

  Scenario: Scenario 8: Update with Missing Availability
    Given the product ID is valid
    And the required attribute 'availability' is missing
    When the store manager attempts to update the product
    Then an error message indicating the missing 'availability' should be displayed

  Scenario: Scenario 9: Update with Missing Category
    Given the product ID is valid
    And the required attribute 'category' is missing
    When the store manager attempts to update the product
    Then an error message indicating the missing 'category' should be displayed
