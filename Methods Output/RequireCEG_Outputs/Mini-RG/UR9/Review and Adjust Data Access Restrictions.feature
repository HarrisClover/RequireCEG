Feature: Review and Adjust Data Access Restrictions

  As a user with access privileges
  I want to view company data according to my access rights
  So that I can effectively manage and analyze the performance metrics relevant to my role

  Background:
    Given the system maintains a list of user access privileges
    And company data has specific access restrictions

  Scenario: Scenario 1: User with Full Access
    Given a user logs into the system
    And the user has full access privileges to the data
    When the user requests to view company data
    Then the user can view all company data
    And the user sees all associated performance metrics without restrictions

  Scenario: Scenario 2: User with Restricted Access
    Given a user logs into the system
    And the user has restricted access privileges
    When the user requests to view restricted company data
    Then the system verifies the user's access privileges
    And the user sees an 'Access Denied' message for restricted data

  Scenario: Scenario 3: User without Access Privileges
    Given a user logs into the system
    And the user lacks full access privileges entirely
    When the user tries to access any company data
    Then the system prevents the user from viewing data
    And the user sees a message indicating that access is not allowed

  Scenario: Scenario 4: User with Mixed Access Privileges
    Given a user logs into the system
    And the company data contains restrictions
    When the user attempts to view both restricted and unrestricted data
    Then the system verifies the user's access privileges
    And the user sees an 'Access Denied' message for restricted data but can view allowed data

  Scenario Outline: Scenario Outline: Access Verification Based on Privileges
    Given the user <user-status> logs into the system
    When the user attempts to view <data-type>
    Then the system displays <access-outcome>
    Examples:
      | user-status | data-type | access-outcome |
      | with full access | company financial data | all data is visible |
      | with restricted access | company performance metrics | 'Access Denied' message |
      | without access privileges | any company data | 'Access not allowed' message |

