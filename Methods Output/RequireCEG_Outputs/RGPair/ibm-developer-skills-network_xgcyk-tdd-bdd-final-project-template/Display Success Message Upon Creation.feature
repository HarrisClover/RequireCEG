Feature: Display Success Message Upon Creation

  As a store owner
  I want to create products with mandatory fields
  So that I can ensure the accuracy and completeness of product information

  Background:
    Given the product creation form is available
    And all mandatory fields are required to be completed

  Scenario: Scenario 1: Successful Product Creation
    Given the name, description, availability status, category, and price are filled with valid data
    When the user submits the product creation form
    Then a 'Success' message should be displayed
    And all input fields should be cleared

  Scenario: Scenario 2: Missing Mandatory Fields - Name
    Given the name field is empty
    When the user attempts to submit the product creation form
    Then an error message should indicate that the name field is required

  Scenario: Scenario 3: Missing Mandatory Fields - Description
    Given the description field is empty
    When the user attempts to submit the product creation form
    Then an error message should indicate that the description field is required

  Scenario: Scenario 4: Missing Mandatory Fields - Availability Status
    Given the availability status field is empty
    When the user attempts to submit the product creation form
    Then an error message should indicate that the availability status field is required

  Scenario: Scenario 5: Missing Mandatory Fields - Category
    Given the category field is empty
    When the user attempts to submit the product creation form
    Then an error message should indicate that the category field is required

  Scenario: Scenario 6: Incorrect Data Format - Negative Price
    Given the price is filled with a negative value
    When the user attempts to submit the product creation form
    Then an error message should indicate that the price must be a positive number

  Scenario Outline: Scenario Outline: Validation of Mandatory Fields
    Given the <field> field is <status>
    When the user submits the product creation form
    Then an error message should indicate that <field> is required
    Examples:
      | field | status |
      | name | empty |
      | description | empty |
      | availability status | empty |
      | category | empty |
      | price | negative |


  Scenario: Scenario 7: Price and Description Required
    Given the price field is filled with a valid number
    And the description field is filled with valid data
    When the user submits the product creation form
    Then a 'Success' message should be displayed

  Scenario: Scenario 8: Price Required with Name
    Given the price field is filled with a valid number
    And the name field is filled with valid data
    When the user submits the product creation form
    Then a 'Success' message should be displayed
