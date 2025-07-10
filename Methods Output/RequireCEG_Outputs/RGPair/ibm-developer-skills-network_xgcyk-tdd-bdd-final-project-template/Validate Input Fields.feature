Feature: Validate Input Fields

  As a store administrator
  I want to ensure that product inputs are validated
  So that incorrect product entries are not accepted

  Background:
    Given the product form is displayed
    And all fields are empty

  Scenario: Scenario 1: Product name is required
    Given the product name field is empty
    When the administrator submits the form
    Then the system should display an error message that the product name is required
    And the product should not be created

  Scenario: Scenario 2: Description cannot be blank
    Given the description field is empty
    When the administrator submits the form
    Then the system should prompt the user that the description cannot be blank
    And the product should not be created

  Scenario: Scenario 3: Availability status must be chosen
    Given the availability status is not selected
    When the administrator submits the form
    Then the system should alert the user to choose an availability option ('In Stock' or 'Out of Stock')
    And the product should not be created

  Scenario: Scenario 4: Category must be selected
    Given the category has not been specified
    When the administrator submits the form
    Then the system should present an error indicating that the category must be chosen
    And the product should not be created

  Scenario: Scenario 5: Price must be a valid number
    Given the price input is not a valid number
    When the administrator submits the form
    Then the system should notify the user to enter a valid numeric price
    And the product should not be created

  Scenario: Scenario 6: Successful product creation
    Given all fields are correctly filled
    When the administrator submits the form
    Then the system should allow the user to successfully create the product
    And display a 'Success' message
    And automatically clear all input fields for the next product entry

  Scenario: Scenario 7: Product creation fails without required fields
    Given one or more required fields are empty
    When the administrator submits the form
    Then the system should not create the product
    And display the respective error messages for each empty field
