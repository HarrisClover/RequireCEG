Feature: Display Home Page Title

  As a store administrator
  I want to verify the successful loading of the product catalog administration page
  So that I can ensure a seamless user experience without error messages

  Background:
    Given the user navigates to the product catalog administration page
    And the system should check if the page loads successfully

  Scenario: Scenario 1: Title Check
    Given the home page title is displayed as 'Product Catalog Administration'
    When the page loads
    Then the title should be visible in the designated title area
    And the system should confirm successful loading

  Scenario: Scenario 2: Title Absent
    Given the home page title is not displayed
    When the user tries to load the product catalog administration page
    Then the system should execute error handling routines

  Scenario: Scenario 3: Page Load Success
    Given the home page title is displayed as 'Product Catalog Administration'
    When the user accesses the product catalog administration page
    Then the system should confirm successful loading of the page

  Scenario: Scenario 4: Page Load Failure
    Given the home page title is not displayed
    When the user accesses the product catalog administration page
    Then the system should deliver a fallback message indicating that the product catalog administration page is currently inaccessible

  Scenario Outline: Scenario Outline: Page Access
    Given the page title is <title-status>
    When the user accesses the product catalog administration page
    Then the system should display a message indicating the page is <access-status>
    Examples:
      | title-status | access-status |
      | present | successfully loaded |
      | absent | currently inaccessible |

