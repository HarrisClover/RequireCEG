Feature: Ensure Page Accessibility Without 404 Error

  As a store admin
  I want to ensure that the 'Product Catalog Administration' home page is accessible
  So that I can manage product information without encountering errors

  Background:
    Given the user attempts to access the 'Product Catalog Administration' home page
    And the user is authenticated and possesses the necessary permissions

  Scenario: Valid URL Access
    Given the URL corresponds to an existing endpoint
    When the user navigates to the 'Product Catalog Administration' home page
    Then the system loads the product catalog administration page successfully
    And no '404 Not Found' error should occur

  Scenario: Invalid URL Access
    Given the URL does not correspond to an existing endpoint
    When the user attempts to access the 'Product Catalog Administration' home page
    Then the user should be redirected to the home page
    And the message 'Error: Page Not Found' is displayed

  Scenario: Access Control for Authenticated User
    Given the user is authenticated and possesses the necessary permissions
    When the user accesses the 'Product Catalog Administration' home page
    Then the appropriate layout and options for managing product information are presented to the user

  Scenario: Access Control for Unauthenticated User
    Given the user is unauthenticated
    When the user attempts to access the 'Product Catalog Administration' home page
    Then the message 'Access Denied' is displayed
    And the user may be redirected to the login page

  Scenario: Access Control for Unauthorized User
    Given the user is authenticated but lacks necessary permissions
    When the user attempts to access the 'Product Catalog Administration' home page
    Then the message 'Access Denied' is displayed
    And the user may be redirected to the login page

  Scenario: Access Control for Authenticated User with Invalid URL
    Given the URL does not correspond to an existing endpoint
    And the user is authenticated and possesses the necessary permissions
    When the user attempts to access the 'Product Catalog Administration' home page
    Then the user should be redirected to the home page
    And the message 'Error: Page Not Found' is displayed

  Scenario: Access Control for Unauthenticated User with Valid URL
    Given the URL corresponds to an existing endpoint
    And the user is unauthenticated
    When the user attempts to access the 'Product Catalog Administration' home page
    Then the message 'Access Denied' is displayed
    And the user may be redirected to the login page
