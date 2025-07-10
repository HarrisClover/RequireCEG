Feature: Filter Products by Category

  As a customer
  I want to filter products based on category and availability
  So that I can easily find products that meet my needs

  Background:
    Given the product database is available
    And the user is on the product selection page

  Scenario: Scenario 1: Select a category without filters
    Given the user selects the 'Electronics' category
    When the system queries the product database to retrieve all products belonging to the selected category
    Then the user sees a list of all available electronic products

  Scenario: Scenario 2: Select a category with the available filter
    Given the user selects the 'Clothing' category
    And the user selects the 'Available' filter
    When the system retrieves available products in the 'Clothing' category
    Then the user sees only clothing items that are currently in stock

  Scenario: Scenario 3: No matching products found
    Given the user selects a category with no available products
    When the system queries the product database
    Then the user sees the message 'No products available in this category.'

  Scenario: Scenario 4: User changes category
    Given the user selects the 'Footwear' category
    And the user selects the 'Available' filter
    When the user changes the selected category to 'Accessories'
    Then the product list should refresh to show products in 'Accessories'
    And the user sees only accessories that are currently in stock

  Scenario Outline: Scenario Outline: Updating filters
    Given the user selects the '<category>' category
    And the user selects the '<availability>' filter
    When the user changes the category to '<new-category>'
    Then the product list should refresh to show products in '<new-category>'
    Examples:
      | category | availability | new-category |
      | Home Appliances | Available | Gardening |
      | Toys | Unavailable | Sports |
      | Footwear | Available | Accessories |

