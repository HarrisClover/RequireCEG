Feature: Search Products by Name

  As a customer
  I want to search for products by name
  So that I can find the items I'm interested in purchasing

  Background:
    Given the product catalog is available
    And there are products listed in the catalog

  Scenario: Scenario 1: Valid Product Found
    Given the user inputs a valid product name 'Sunglasses'
    When the system searches for the product
    Then the details of 'Sunglasses' are displayed
    And the product name, description, price, availability, and category are shown

  Scenario: Scenario 2: No Product Found
    Given the user inputs an invalid product name 'NotARealProduct'
    When the system searches for the product
    Then the system returns a message stating 'No products were found.'

  Scenario: Scenario 3: Empty Product Name Input
    Given the user inputs an empty name
    When the system processes the search
    Then the system prompts with the message 'Please enter a valid product name.'

  Scenario: Scenario 4: Adding a New Product to the Catalog and Searching for It Later
    Given the system has added a new product 'New Product' to the catalog
    When the user searches for 'New Product'
    Then the details of 'New Product' are displayed
    And the system reflects the addition of the new product in subsequent search results.

  Scenario: Scenario 5: Updating an Existing Product Name and Searching for It
    Given the system has updated an existing product 'Old Name' to 'New Name'
    When the user searches for 'New Name'
    Then the details of 'New Name' are displayed instead of 'Old Name'
    And the system replaces the old product name with the new one in the search results.

  Scenario: Scenario 6: Deletion of a Product from the Catalog
    Given the product 'Obsolete Product' is deleted from the catalog
    When the user searches for 'Obsolete Product'
    Then the system returns a message stating 'No products were found.'
    And displays a confirmation message 'Product deleted successfully.'

  Scenario: Scenario 7: New Product Affects Search Results
    Given a new product 'Smartwatch' is created and added to the catalog
    When the user searches for 'Smartwatch'
    Then the details of 'Smartwatch' are displayed
    And the system reflects the addition of the new product in subsequent search results.

  Scenario: Scenario 8: Existing Product Update Affects Search Results
    Given an existing product 'Smartphone' is updated to 'Smartphone Pro'
    When the user searches for 'Smartphone Pro'
    Then the details of 'Smartphone Pro' are displayed instead of 'Smartphone'
    And the system replaces the old product name with the new one in the search results.
