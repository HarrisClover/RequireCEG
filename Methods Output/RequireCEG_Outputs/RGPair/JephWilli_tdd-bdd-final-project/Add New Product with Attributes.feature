Feature: Add New Product with Attributes

  As a store owner
  I want to create new products in the system with specific details
  So that I can manage my inventory effectively and ensure customers can see the available products

  Background:
    Given the product catalog is empty

  Scenario: Scenario 1: Successful Product Creation
    Given the product name is 'Tea Shirt'
    And the description is 'A comfortable t-shirt'
    And the price is '$25'
    And the availability status is 'In Stock'
    And the category is 'Clothing'
    When the store owner submits the product details
    Then the system generates a unique product ID
    And the product details are saved
    And a success message is displayed
    And the input fields are cleared

  Scenario: Scenario 2: Empty Fields Error
    Given the product name is ''
    And the description is 'A red shirt'
    And the price is '$20'
    And the availability status is 'In Stock'
    And the category is 'Clothing'
    When the store owner submits the product details
    Then an error message is displayed indicating 'Product name cannot be empty'
    And the product details are not saved

  Scenario: Scenario 3: Duplicate Product Name Error
    Given the product name is 'Sunglasses'
    And the description is 'Stylish sunglasses'
    And the price is '$90'
    And the availability status is 'In Stock'
    And the category is 'Accessories'
    When the store owner submits the product details
    Then an error message is displayed indicating 'Product name already exists, please choose a different name'
    And the product details are not saved

  Scenario: Scenario 4: Invalid Category Error
    Given the product name is 'Mug'
    And the description is 'Ceramic mug'
    And the price is '$15'
    And the availability status is 'In Stock'
    And the category is 'Beverages'
    When the store owner submits the product details
    Then an error message is displayed indicating 'Invalid category provided'
    And the product details are not saved

  Scenario: Scenario 5: Invalid Product Category Handling
    Given the product name is 'Invalid Category Product'
    And the description is 'A product with invalid category'
    And the price is '$30'
    And the availability status is 'In Stock'
    And the category is 'Invalid'
    When the store owner submits the product details
    Then an error message is displayed indicating 'Invalid category provided'
    And the product details are not saved

  Scenario Outline: Scenario Outline: Different Product Creation Scenarios
    Given the product name is '<product-name>'
    And the description is '<description>'
    And the price is '<price>'
    And the availability status is '<availability>'
    And the category is '<category>'
    When the store owner submits the product details
    Then the system processes the request
    And the outcome should be '<expected-outcome>'
    Examples:
      | product-name | description | price | availability | category | expected-outcome |
      | Hat | Cool summer hat | $30 | In Stock | Accessories | Success |
      |  | New fancy shoes | $100 | In Stock | Footwear | Product name cannot be empty |
      | Sunglasses | Cheap sunglasses | $20 | Out of Stock | Accessories | Product name already exists, please choose a different name |
      | Umbrella | Large size umbrella | $40 | In Stock | Weather Gear | Success |

