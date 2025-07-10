Feature: Clear Input Fields After Success

  As a store owner
  I want to ensure that user inputs are validated and cleared after success
  So that users can enter new product details easily without previous data interference

  Background:
    Given the system is ready to accept product entries
    And the user has a valid session logged in

  Scenario: Scenario 1: Successful Product Creation
    Given the user provides a valid product name
    And the user provides a valid description
    And the user selects 'available' for availability status
    And the user selects a valid category
    And the user enters a positive price
    When the user submits the product details
    Then the system should display a 'Success' message
    And the input fields for name, description, availability status, category, and price should be cleared

  Scenario: Scenario 2: Invalid Input - Empty Name
    Given the user leaves the product name empty
    When the user submits the product details
    Then the system should not display a 'Success' message
    And the input fields should retain the current values

  Scenario: Scenario 3: Invalid Input - Negative Price
    Given the user enters a negative price
    When the user submits the product details
    Then the system should not display a 'Success' message
    And the input fields should retain the current values

  Scenario: Scenario 4: Invalid Input - Category Validation
    Given the user enters a product name
    And the user provides a valid description
    And the user selects 'available' for availability status
    And the user enters an invalid category
    And the user enters a positive price
    When the user submits the product details
    Then the system should not display a 'Success' message
    And the input fields should retain the current values

  Scenario Outline: Scenario Outline: Validate Product Inputs
    Given the user inputs the product name as '<name>'
    And the user provides the description as '<description>'
    And the user sets the availability status to '<availability>'
    And the user selects the category as '<category>'
    And the user enters the price as '<price>'
    When the user submits the product details
    Then the system should <successOutcome>
    And the input fields should <fieldOutcome>
    Examples:
      | name | description | availability | category | price | successOutcome | fieldOutcome |
      | T-Shirt | A comfortable t-shirt | available | Clothing | 25 | display a 'Success' message | be cleared |
      |  | A comfortable t-shirt | available | Clothing | 25 | not display a 'Success' message | retain values |
      | T-Shirt | A comfortable t-shirt | available | Clothing | -25 | not display a 'Success' message | retain values |
      | Sunglasses |  | unavailable | Accessories | 50 | not display a 'Success' message | retain values |

