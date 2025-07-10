Feature: Delete Product with Confirmation Message

  As a product store owner
  I want to confirm deletion of products from the catalog
  So that I can avoid accidental deletions and manage products effectively

  Background:
    Given the product catalog is displayed
    And the owner selects a product for deletion

  Scenario: Confirming Product Deletion
    Given the confirmation prompt is displayed asking 'Are you sure you want to delete this product?'
    When the owner clicks 'Yes'
    Then the product is removed from the catalog
    And a success message 'Product deleted successfully' is displayed

  Scenario: Cancelling Product Deletion
    Given the confirmation prompt is displayed asking 'Are you sure you want to delete this product?'
    When the owner clicks 'No'
    Then the product remains in the catalog
    And a message 'Product deletion canceled' is displayed

  Scenario: Display Confirmation Prompt
    Given the product is selected for deletion
    When the system processes the input
    Then a confirmation prompt asking 'Are you sure you want to delete this product?' is displayed

  Scenario: Update Search Functionality Upon Deletion
    Given the product is successfully deleted from the catalog
    When the system updates the search functionality
    Then the deleted product does not appear in future search results

  Scenario: Cancel Deletion with Message
    Given the confirmation prompt is displayed asking 'Are you sure you want to delete this product?'
    When the owner clicks 'No'
    Then the product remains in the catalog
    And the system displays a cancellation message 'Product deletion canceled'
