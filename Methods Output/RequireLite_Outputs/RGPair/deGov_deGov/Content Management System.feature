Feature: Content Management System

  As an administrator
  I want to manage content and user accounts effectively
  So that I can maintain a well-structured and compliant platform

  Background:
    Given the administrator is logged into the system
    And the system is configured with proper permissions

  Scenario 1: Adding Media with Validation
    Given the administrator is on the content management page
    When the administrator adds a document with valid metadata
    Then the media should be saved successfully
    And the media should be accessible from the content library

  Scenario 2: Adding Taxonomy Terms with Context
    Given the administrator is on the taxonomy management page
    When the administrator adds a new term to a selected taxonomy
    Then the term should be included in the taxonomy list
    And existing content should be categorized accordingly

  Scenario Outline: Scenario Outline: User Management
    Given the administrator has <number> accounts to manage with defined access levels
    When the administrator reviews the accounts
    Then the accounts should reflect <status>
    And the accounts are structured with <access-level> access based on defined permissions
    Examples:
      | number | access-level | status |
      | 5 | admin | active |
      | 3 | editor | inactive |
      | 10 | viewer | pending |

