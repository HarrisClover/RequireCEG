Feature: REST Mock Service Dispatching
  As a user,
  I want to control how mock responses are dispatched for REST services,
  So that I can simulate different API behaviors like sequences or conditional logic.

  Scenario: Configure SEQUENCE dispatch for a REST mock action
    Given a REST Mock Service "Product API" with resource "/products" and method "GET"
    And multiple mock responses defined: "Response A", "Response B"
    When the user configures the dispatch mode for "GET /products" to SEQUENCE
    Then the dispatch mode should be set to SEQUENCE

  Scenario: Verify SEQUENCE dispatch serves responses in order
    Given the dispatch mode for "GET /products" in "Product API" is set to SEQUENCE
    And the defined responses are "Response A" followed by "Response B"
    When the user sends a request to "GET /products"
    Then the mock service should return "Response A"
    When the user sends another request to "GET /products"
    Then the mock service should return "Response B"
    When the user sends a third request to "GET /products"
    Then the mock service should return "Response A" again (assuming loop)

  Scenario: Configure SCRIPT dispatch for a REST mock action
    Given a REST Mock Service "Inventory API" with resource "/items/{itemId}" and method "GET"
    And multiple mock responses defined: "In Stock", "Out of Stock"
    When the user configures the dispatch mode for "GET /items/{itemId}" to SCRIPT
    And provides a script: "if (request.getPathParams().get('itemId') == '123') { return 'In Stock' } else { return 'Out of Stock' }"
    Then the dispatch mode should be set to SCRIPT with the provided script

  Scenario: Verify SCRIPT dispatch determines response based on script logic
    Given the dispatch mode for "GET /items/{itemId}" in "Inventory API" is set to SCRIPT with the logic: item '123' is 'In Stock', others are 'Out of Stock'
    When the user sends a request to "GET /items/123"
    Then the mock service should return the "In Stock" response
    When the user sends a request to "GET /items/456"
    Then the mock service should return the "Out of Stock" response