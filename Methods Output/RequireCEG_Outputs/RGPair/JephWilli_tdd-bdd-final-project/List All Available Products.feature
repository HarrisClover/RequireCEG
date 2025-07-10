Feature: List All Available Products

  As a product store owner
  I want to manage the display of available products
  So that customers can only see products that are currently available for purchase

  Background:
    Given the system is initialized
    And there are products marked as available in the database

  Scenario: Scenario 1: Displaying available products
    Given the store owner selects the option to list all available products
    When the system queries the database for available products
    Then the system retrieves and displays all products marked as available

  Scenario: Scenario 2: Updating product availability
    Given a product's availability status is updated to unavailable
    When the system refreshes the display list
    Then the product is removed from the display list

  Scenario: Scenario 3: No available products
    Given all products have been marked as unavailable
    When the store owner selects the option to list all available products
    Then the interface displays the message 'No products are currently available.'

  Scenario: Scenario 4: Filtering products by category
    Given the store owner applies a filter by category
    When the system retrieves available products that match the selected category
    Then the system displays only available items matching the selected category

  Scenario: Scenario 5: Deleting a product
    Given a product is selected for deletion
    When the store owner deletes the product
    Then the system displays a confirmation message stating 'Product successfully deleted'
    And the product is removed from all listings

  Scenario Outline: Scenario Outline: Product availability update
    Given a product's availability is set to <availability>
    And the product is <status> in the listing
    When the store owner updates the availability status
    Then the product should be <expected-status> in the display
    Examples:
      | availability | status | expected-status |
      | available | listed | listed |
      | unavailable | listed | not listed |
      | unavailable | not listed | not listed |
      | available | not listed | listed |

