Feature: Access Sitemap Options

  As an anonymous user
  I want to navigate seamlessly to the start page and access the sitemap
  So that I can view available content and features

  Background:
    Given the user is an anonymous user accessing the start page
    And the system displays options to access the login page and the sitemap

  Scenario: Scenario 1: Access Sitemap as an Anonymous User
    Given the user clicks on the sitemap option
    Then the system displays a well-structured overview of available content and features

  Scenario: Scenario 2: Access Sitemap as an Administrator
    Given the user is logged in as an administrator
    When the user accesses the sitemap
    Then the system displays a well-structured overview of available content and features
    And the system provides additional functionalities designated for the administrator role

  Scenario: Scenario 3: Access Sitemap without Necessary Permissions
    Given the user attempts to access the sitemap without the necessary permissions
    Then the system presents an error message indicating that access to the sitemap is restricted

  Scenario: Scenario 4: Navigation and Sitemap Access
    Given the user is an anonymous user accessing the start page
    And the user clicks on the sitemap option
    Then the system allows seamless navigation to the start page

  Scenario: Scenario 5: Administrator Permission Check
    Given the user is logged in as an administrator
    When the user tries to access the sitemap
    Then the system permits access to the sitemap with additional functionalities designated for the administrator

  Scenario: Scenario 6: Restricted Access to Sitemap
    Given the user attempts to access the sitemap without the necessary permissions
    Then the system presents an error message indicating that access to the sitemap is restricted

  Scenario Outline: Scenario Outline: Accessing Sitemap Under Different Conditions
    Given the user role is '<role>'
    When the user attempts to access the sitemap
    Then the outcome should be '<outcome>'
    Examples:
      | role | outcome |
      | anonymous | the system displays a well-structured overview of available content and features |
      | administrator | the system permits access to the sitemap with additional functionalities designated for the administrator |
      | user without permissions | the system presents an error message indicating that access to the sitemap is restricted |

