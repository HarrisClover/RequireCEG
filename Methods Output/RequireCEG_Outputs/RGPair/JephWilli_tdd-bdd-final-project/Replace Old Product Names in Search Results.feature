Feature: Replace Old Product Names in Search Results

  As a store manager
  I want the system to automatically update search results when a product name changes
  So that customers can always find the most accurate and current product information

  Background:
    Given a product exists in the catalog with a specific name and availability status
    And the product has been categorized correctly

  Scenario: Scenario 1: Updating a product name
    Given the product name is updated from 'Old Product' to 'New Product'
    When a user searches for 'Old Product'
    Then the search results must not include 'Old Product'
    And the search results must include 'New Product'

  Scenario: Scenario 2: Verifying updated product inclusion
    Given the product name has been changed to 'Updated Product'
    When a user performs a search immediately after the update
    Then the search results must display 'Updated Product'

  Scenario: Scenario 3: Omitting old product name from search results
    Given the product name is updated from 'Old Name' to 'New Name'
    When a user searches for 'Old Name'
    Then the search results must not present 'Old Name'

  Scenario: Scenario 4: Confirming inclusion of updated product name
    Given the product name is updated from 'Obsolete Item' to 'Current Item'
    When a user searches immediately after the name change
    Then the search results must contain 'Current Item'

  Scenario: Scenario 5: Presenting current product information
    Given multiple updates to the product's name have been made
    When a user searches for the product
    Then the search results must reflect the most current product information seamlessly

  Scenario Outline: Scenario Outline: Search results after product name change
    Given a product with an old name '<old-name>'
    And the product name is updated to '<new-name>'
    When a user searches for '<old-name>'
    Then the results must not include '<old-name>'
    And the results must include '<new-name>'
    Examples:
      | old-name | new-name |
      | Classic Watch | Modern Watch |
      | Vintage Chair | Contemporary Chair |
      | Sports Shoes | Athletic Sneakers |

