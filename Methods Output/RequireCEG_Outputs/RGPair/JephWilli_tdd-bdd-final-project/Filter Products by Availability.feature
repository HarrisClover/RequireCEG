Feature: Filter Products by Availability

  As a store owner
  I want to filter products based on their availability status
  So that customers can easily find the products they want

  Background:
    Given a product catalog exists in the system
    And the customer is logged into the system

  Scenario: Scenario 1: Filter Available Products
    Given the store owner selects 'Available' as the availability status
    When the system queries the database
    Then only products marked as 'Available' are displayed
    And no 404 error pages are encountered

  Scenario: Scenario 2: Filter Unavailable Products
    Given the store owner selects 'Unavailable' as the availability status
    When the system queries the database
    Then only products marked as 'Unavailable' are displayed
    And no 404 error pages are encountered

  Scenario: Scenario 3: Display All Products
    Given the store owner has not selected any availability status
    When the system queries the database
    Then all products in the catalog are displayed
    And no 404 error pages are encountered

  Scenario: Scenario 4: Validate Response Time for Available Products
    Given the store owner selects 'Available' as the availability status
    When the system queries the database
    Then the system maintains prompt response times to ensure a seamless user experience

  Scenario: Scenario 5: Validate Response Time for Unavailable Products
    Given the store owner selects 'Unavailable' as the availability status
    When the system queries the database
    Then the system maintains prompt response times to ensure a seamless user experience

  Scenario: Scenario 6: Validate Response Time for All Products
    Given the store owner has not selected any availability status
    When the system queries the database
    Then the system maintains prompt response times to ensure a seamless user experience

  Scenario Outline: Scenario Outline: Filter Products by Status
    Given the store owner selects <availability-status> as the availability status
    When the system retrieves products from the database
    Then products marked as <availability-status> are displayed
    And no 404 error pages are encountered
    Examples:
      | availability-status | expected-result |
      | Available | products marked as Available displayed |
      | Unavailable | products marked as Unavailable displayed |
      | All | all products displayed |

