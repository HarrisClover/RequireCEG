Feature: Display Retrieved Product Information

  As a store manager
  I want to retrieve product information from the database
  So that I can manage the inventory accurately and efficiently

  Background:
    Given the product ID is valid and exists in the database
    And the user is logged into the management system

  Scenario: Scenario 1: Successful retrieval of product information
    Given the user enters a valid product ID
    And the user presses the retrieve button
    When the system processes the product ID
    Then the correct product information is displayed
    And a confirmation message is shown indicating that the information is accurate

  Scenario: Scenario 2: Failed retrieval of product information
    Given the user enters an invalid product ID
    When the user presses the retrieve button
    Then an error message is displayed stating that the product could not be found

  Scenario: Scenario 3: Confirmation and error message displays
    Given the user enters a valid product ID
    And the user presses the retrieve button
    When the system processes the product ID and the product ID is valid
    Then the correct product information is displayed
    And the confirmation message indicating the information is accurate is shown

  Scenario: Scenario 4: Error message when product ID is invalid
    Given the user enters an invalid product ID
    When the user presses the retrieve button
    Then an error message is displayed stating that the product could not be found

  Scenario Outline: Scenario Outline: Product ID retrieval outcomes
    Given the user enters a product ID of <product-id>
    When the user presses the retrieve button
    Then the product status should be <product-status>
    Examples:
      | product-id | product-status |
      | 12345 | available |
      | 67890 | not found |
      | 54321 | available |

