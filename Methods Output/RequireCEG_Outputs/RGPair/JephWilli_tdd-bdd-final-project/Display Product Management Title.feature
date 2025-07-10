Feature: Display Product Management Title

  As a store owner
  I want to manage products effectively
  So that I can keep track of my inventory and ensure smooth operations

  Background:
    Given the product catalog service is accessed
    And the user is logged in

  Scenario: Scenario 1: Adding a Product
    Given the user selects the option to add a new product
    When the user enters the product details and submits
    Then the title 'Product Management' is displayed at the top of the interface
    And the confirmation message 'Product added successfully!' is shown below the title

  Scenario: Scenario 2: Updating a Product
    Given the user selects an existing product to update
    When the user updates the product details and submits
    Then the title 'Product Management' is displayed at the top of the interface
    And the confirmation message 'Product updated successfully!' is shown below the title

  Scenario: Scenario 3: Deleting a Product
    Given the user selects an existing product to delete
    When the user confirms the deletion
    Then the title 'Product Management' is displayed at the top of the interface
    And the confirmation message 'Product deleted successfully!' is shown below the title

  Scenario: Scenario 4: Searching for a Product
    Given the user performs a search for a product
    When the search yields no matching products
    Then the title 'Product Management' is displayed at the top of the interface
    And the message 'No products found' is shown below the title

  Scenario: Scenario 5: Adding or Updating Products
    Given the user selects an option to add or update a product
    When the user enters the product details
    Then the confirmation message 'Product added successfully!' is shown below the title
    And the confirmation message 'Product updated successfully!' is shown below the title

  Scenario: Scenario 6: Mutual Exclusion Between Adding and Updating
    Given the user attempts to add a new product
    And the user attempts to update an existing product
    When the system processes both actions
    Then the confirmation message 'Product added successfully!' is shown below the title
    And the confirmation message 'Product updated successfully!' must not be shown
