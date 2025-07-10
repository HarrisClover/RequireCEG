Feature: Confirm Actions with Success Messages

  As a store owner
  I want to receive messages confirming product actions
  So that I can ensure customers are informed about product additions, updates, and deletions

  Background:
    Given a product exists in the system
    And the user is logged into the system

  Scenario: Scenario 1: Adding a new product
    Given the user enters product details
    When the user submits the new product
    Then the system displays 'Product added successfully'
    And all input fields for new product entries are cleared

  Scenario: Scenario 2: Updating an existing product
    Given an existing product is selected
    When the user updates the product details
    Then the system displays 'Product has been updated'
    And the displayed search results refresh to show the updated product name

  Scenario: Scenario 3: Deleting a product
    Given the user selects a product for deletion
    When the user confirms the deletion
    Then the system displays 'Product is no longer available'
    And the deleted product is removed from the search results

  Scenario: Scenario 4: Conducting a product search after adding a product
    Given a user has performed an action on a product 'addition'
    When the user conducts a product search
    Then the search results reflect the latest state of product availability

  Scenario: Scenario 5: Conducting a product search after updating a product
    Given a user has performed an action on a product 'update'
    When the user conducts a product search
    Then the search results reflect the latest state of product availability

  Scenario: Scenario 6: Conducting a product search after deleting a product
    Given a user has performed an action on a product 'deletion'
    When the user conducts a product search
    Then the search results reflect the latest state of product availability
