Feature: Ensure Deleted Products are Removed from Search Results

  As a Product Store Owner
  I want to remove products from the catalog and ensure they are not searchable or retrievable
  So that the catalog accurately reflects the current inventory available for sale

  Background:
    Given the product catalog contains a list of products
    And the Product Store Owner is logged into the system

  Scenario: Scenario 1: Successful product deletion
    Given a product with ID 123 exists in the catalog
    When the Product Store Owner deletes the product with ID 123
    Then a success message is displayed indicating the product has been successfully removed
    And the product with ID 123 no longer appears in search results

  Scenario: Scenario 2: Attempt to search for deleted product
    Given the product with ID 123 has been deleted
    When the Product Store Owner searches for the product with name 'Sample Product'
    Then the system returns an empty result set

  Scenario: Scenario 3: Attempt to search for deleted product by category
    Given the product with ID 123 has been deleted
    When the Product Store Owner searches for the product by category
    Then the system returns an empty result set

  Scenario: Scenario 4: Attempt to retrieve deleted product details
    Given the product with ID 123 has been deleted
    When the Product Store Owner tries to retrieve details using the ID 123
    Then the system shows an error message stating that the product no longer exists in the catalog

  Scenario Outline: Scenario Outline: Confirming product deletion success
    Given the product with ID <product-id> exists in the catalog
    When the Product Store Owner deletes the product with ID <product-id>
    Then a success message is displayed indicating the product has been successfully removed
    And the product with ID <product-id> no longer appears in any search results
    Examples:
      | product-id |
      | 123 |
      | 456 |
      | 789 |

