Feature: Product Catalog Management via RESTful API
  As a Product Store Owner (or an interacting system component),
  I want to manage products using a RESTful API
  So that the product catalog is accurate and up-to-date.

  Background:
    Given the Product Catalog RESTful service is running

  Scenario: Successfully add a new product
    Given I have the details for a new product:
      | attribute   | value             |
      | name        | "Wireless Mouse"  |
      | description | "Ergonomic design"|
      | price       | 25.99             |
      | availability| true              |
      | category    | "Accessories"     |
    When I send a POST request to the "/products" endpoint with the product details
    Then the response status code should be 201 (Created)
    And the response body should contain the created product details including a unique ID
    And the response should indicate a success message for product creation

  Scenario: Retrieve a specific product by its ID
    Given a product exists with ID "prod123" and details:
      | attribute   | value             |
      | name        | "Laptop Pro"      |
      | description | "High performance"|
      | price       | 1499.99           |
      | availability| true              |
      | category    | "Electronics"     |
    When I send a GET request to the "/products/prod123" endpoint
    Then the response status code should be 200 (OK)
    And the response body should contain the details for product "prod123"

  Scenario: Attempt to retrieve a non-existent product by ID
    Given no product exists with ID "prod999"
    When I send a GET request to the "/products/prod999" endpoint
    Then the response status code should be 404 (Not Found)

  Scenario: Successfully update an existing product
    Given a product exists with ID "prod456" and initial details:
      | attribute   | value             |
      | name        | "Basic Keyboard"  |
      | price       | 45.00             |
      | availability| true              |
      | category    | "Accessories"     |
    When I send a PUT request to the "/products/prod456" endpoint with updated details:
      | attribute   | value                 |
      | name        | "Mechanical Keyboard" |
      | price       | 75.50                 |
      | availability| true                  |
      | category    | "Gaming Accessories"  |
    Then the response status code should be 200 (OK) # Or potentially 204 No Content
    And the response should indicate a success message for product update
    And a subsequent GET request to "/products/prod456" should return the updated details

  Scenario: Successfully delete an existing product
    Given a product exists with ID "prod789"
    When I send a DELETE request to the "/products/prod789" endpoint
    Then the response status code should be 200 (OK) # Or potentially 204 No Content
    And the response should indicate a success message for product deletion
    And a subsequent GET request to "/products/prod789" should return a 404 (Not Found) status code

  Scenario Outline: List and filter products
    Given the following products exist in the catalog:
      | id     | name              | category           | price  | availability |
      | prod01 | "Laptop Pro"      | "Electronics"      | 1499.99| true         |
      | prod02 | "Wireless Mouse"  | "Accessories"      | 25.99  | true         |
      | prod03 | "T-Shirt"         | "Clothing"         | 19.99  | true         |
      | prod04 | "Old Monitor"     | "Electronics"      | 99.00  | false        |
      | prod05 | "Gaming Keyboard" | "Gaming Accessories" | 85.00  | true         |
    When I send a GET request to the "/products" endpoint with query parameter "<filter_key>"="<filter_value>"
    Then the response status code should be 200 (OK)
    And the response body should contain a list of products with the following IDs: <expected_ids>

    Examples: List All (no filter - assuming empty value means no filter)
      | filter_key | filter_value | expected_ids                         |
      |            |              | prod01, prod02, prod03, prod04, prod05 |

    Examples: Filter by Category
      | filter_key | filter_value  | expected_ids      |
      | category   | "Electronics" | prod01, prod04    |
      | category   | "Clothing"    | prod03            |
      | category   | "Accessories" | prod02            |

    Examples: Filter by Availability
      | filter_key   | filter_value | expected_ids             |
      | availability | "true"       | prod01, prod02, prod03, prod05 |
      | availability | "false"      | prod04                   |

    Examples: Filter by Name (Exact Match or Contains - depends on implementation, assuming contains here)
      | filter_key | filter_value | expected_ids      |
      | name       | "Laptop Pro" | prod01            |
      | name       | "Keyboard"   | prod05            | # Assuming partial match/search capability

  Scenario: Updated product names are reflected in search results
    Given a product exists with ID "prod456" and name "Basic Keyboard"
    And I update the product "prod456" name to "Mechanical Keyboard" via a PUT request
    When I send a GET request to the "/products" endpoint with query parameter "name"="Mechanical Keyboard"
    Then the response status code should be 200 (OK)
    And the response body should contain the product with ID "prod456"
    When I send a GET request to the "/products" endpoint with query parameter "name"="Basic Keyboard"
    Then the response status code should be 200 (OK)
    And the response body should *not* contain the product with ID "prod456"

  Scenario: Deleted products do not appear in list or search results
    Given a product exists with ID "prod789" and name "Webcam"
    And I delete the product "prod789" via a DELETE request
    When I send a GET request to the "/products" endpoint # List all
    Then the response status code should be 200 (OK)
    And the response body should *not* contain the product with ID "prod789"
    When I send a GET request to the "/products" endpoint with query parameter "name"="Webcam"
    Then the response status code should be 200 (OK)
    And the response body should *not* contain the product with ID "prod789"