Feature: Clear Input Fields after Product Creation

  As a store owner
  I want to create products with valid attributes and ensure a clean interface after creation
  So that I can easily manage product entries without clutter

  Background:
    Given a user is on the product creation form
    And the user has filled in valid attributes for the product

  Scenario: Scenario 1: Successful Product Creation
    Given all required fields are filled in
    And the inputs are valid
    When the user clicks the 'Create Product' button
    Then the product is created successfully
    And a success message is displayed

  Scenario: Scenario 2: Product Creation with Empty Fields
    Given the user has left some required fields empty
    When the user clicks the 'Create Product' button
    Then an error message is displayed prompting to fill in all required fields

  Scenario: Scenario 3: Product Creation with Invalid Inputs
    Given the user has filled in some fields with invalid data
    When the user clicks the 'Create Product' button
    Then an error message is displayed indicating which inputs are invalid

  Scenario: Scenario 4: Displaying Product ID after Creation Success
    Given the user has successfully created a product with valid inputs
    When the product is created
    Then the input fields are cleared

  Scenario Outline: Scenario Outline: Clear Input Fields after Creation
    Given the user successfully creates a product with <product-name>
    When the product is created
    Then all input fields are cleared
    Examples:
      | product-name |
      | Tea Shirt |
      | Sunglasses |
      | Cookies |

