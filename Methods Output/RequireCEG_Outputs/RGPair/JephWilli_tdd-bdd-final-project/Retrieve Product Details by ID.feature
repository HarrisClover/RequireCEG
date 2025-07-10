Feature: Retrieve Product Details by ID

  As a user
  I want to retrieve product details using a valid product ID
  So that I can view the product information such as name, description, price, availability, and category

  Background:
    Given the product catalog service is available
    And the user is logged into the system

  Scenario: Scenario 1: Valid product ID
    Given a valid product ID is entered
    When the user requests product details
    Then the system should return the product details
    And present a success message with relevant information

  Scenario: Scenario 2: Invalid product ID
    Given an invalid product ID is entered
    When the user requests product details
    Then the system should display a message stating that the product does not exist

  Scenario: Scenario 3: Product catalog service down
    Given the product catalog service is unavailable
    When the user requests product details
    Then the system should return a 404 error indicating that the product catalog service is currently unavailable

  Scenario: Scenario 4: Valid product ID when catalog is down
    Given a valid product ID is entered
    And the product catalog service is down
    When the user requests product details
    Then the system should return a 404 error indicating that the product catalog service is currently unavailable

  Scenario: Scenario 5: Invalid product ID with service available
    Given an invalid product ID is entered
    When the user requests product details
    Then the system should display a message stating that the product does not exist
