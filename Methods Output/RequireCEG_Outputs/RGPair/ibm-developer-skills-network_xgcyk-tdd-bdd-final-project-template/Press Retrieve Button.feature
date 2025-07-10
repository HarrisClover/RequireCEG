Feature: Press Retrieve Button

  As a user
  I want to retrieve product details using a unique product ID
  So that I can view the information and availability of the product

  Background:
    Given the product ID is valid and entered in the designated field
    And the user is logged into the system

  Scenario: Scenario 1: Valid Product ID
    Given a unique product ID is pasted in the designated field
    When the user presses the retrieve button
    Then the product information should be displayed including name, description, status, category, and price
    And a confirmation message should be shown stating 'Product details have been successfully loaded.'

  Scenario: Scenario 2: Invalid Product ID Format
    Given the product ID is not unique or incorrectly formatted
    When the user presses the retrieve button
    Then an error message should be displayed stating 'Invalid product ID. Please check and try again.'

  Scenario: Scenario 3: Non-existing Product ID
    Given a unique but non-existing product ID is pasted
    When the user presses the retrieve button
    Then an error message should indicate 'Product cannot be found.'

  Scenario: Scenario 4: Invalid Product ID Condition
    Given an invalid product ID is pasted
    When the user presses the retrieve button
    Then an error message should be displayed stating 'Invalid product ID. Please check and try again.'

  Scenario: Scenario 5: Duplicate Product ID Condition
    Given a duplicated product ID is pasted
    When the user presses the retrieve button
    Then an error message should be displayed stating 'Invalid product ID. Please check and try again.'

  Scenario Outline: Scenario Outline: Retrieve Product Details
    Given the product ID is '<product-id>'
    And the user is logged into the system
    When the user presses the retrieve button
    Then the product details should be '<expected-details>'
    Examples:
      | product-id | expected-details |
      | 12345 | Product Name: Widget A, Price: $25.00, Status: Available |
      | 67890 | Product Name: Widget B, Price: $15.00, Status: Out of Stock |
      | ABCDE | Invalid product ID |


  Scenario: Scenario 6: Unique condition for Product ID Exist
    Given a unique product ID is pasted in the designated field
    When the user presses the retrieve button
    Then the product ID must exist in the database and valid messages should be displayed.
