Feature: Product Catalog Management
  As a Product Store Owner
  I want to manage product information via the administration interface
  So that I can keep the product catalog accurate and up-to-date

  Background:
    Given the Product Store Owner is logged into the system

  Scenario: Accessing the Product Catalog Administration Page
    When the Product Store Owner navigates to the Product Catalog Administration page
    Then the page should load successfully without a '404 Not Found' error
    And the page title should be "Product Catalog Administration"

  Scenario: Successfully Creating a New Product
    Given the Product Store Owner is on the "Product Catalog Administration" page
    When the Product Store Owner enters the following details for a new product:
      | Field             | Value                  |
      | Name              | "Super Widget"         |
      | Description       | "The best widget ever" |
      | Availability Status| "Available"            |
      | Category          | "Widgets"              |
      | Price             | "19.99"                |
    And the Product Store Owner clicks the "Create Product" button # Assuming a button name
    Then a "Success" message should be displayed
    And the Name input field should be empty
    And the Description input field should be empty
    And the Availability Status input should be reset # Or empty, depending on control type
    And the Category input field should be empty
    And the Price input field should be empty

  Scenario: Retrieving an Existing Product by ID
    Given a product exists with the following details:
      | Field             | Value                  |
      | ID                | "XYZ-789"              |
      | Name              | "Existing Gadget"      |
      | Description       | "A reliable old gadget"|
      | Availability Status| "Available"            |
      | Category          | "Gadgets"              |
      | Price             | "25.50"                |
    And the Product Store Owner is on the "Product Catalog Administration" page
    When the Product Store Owner enters "XYZ-789" into the "Product ID" retrieval field # Assuming a field name
    And the Product Store Owner clicks the "Retrieve" button # Assuming a button name
    Then the Name field should display "Existing Gadget"
    And the Description field should display "A reliable old gadget"
    And the Availability Status should be set to "Available" # Or reflect the status accurately
    And the Category field should display "Gadgets"
    And the Price field should display "25.50"