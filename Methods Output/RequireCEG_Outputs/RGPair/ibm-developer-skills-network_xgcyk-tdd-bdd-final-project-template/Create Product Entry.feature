Feature: Create Product Entry

  As a product administrator
  I want to create a new product entry in the system
  So that I can manage the product catalog effectively

  Background:
    Given the user accesses the 'Product Catalog Administration' home page
    And the page loads successfully

  Scenario: Valid Product Entry Creation
    Given the user fills in all required fields with valid data
    When the user clicks the 'Create Product' button
    Then the system creates a new product entry
    And displays a 'Success' message to the user

  Scenario: Invalid Product Entry Creation - Blank Fields
    Given the user leaves one or more required fields blank
    When the user clicks the 'Create Product' button
    Then an error message 'All fields are required' is displayed

  Scenario: Invalid Product Entry Creation - Invalid Data
    Given the user enters an invalid price format
    When the user clicks the 'Create Product' button
    Then an error message 'Invalid price format' is displayed

  Scenario: Retrieve Product by Unique ID
    Given the user enters a unique product ID in the retrieve field
    When the user presses the 'Retrieve' button
    Then the system searches for the product ID
    And if found, populates the form fields with the product details

  Scenario: Retrieve Product by Unique ID - Not Found
    Given the user enters a non-existent product ID in the retrieve field
    When the user presses the 'Retrieve' button
    Then an error message 'Product not found' is displayed

  Scenario: Page Accessibility Check
    Given the user accesses the 'Product Catalog Administration' home page
    Then the page is accessible without triggering a '404 Not Found' error
