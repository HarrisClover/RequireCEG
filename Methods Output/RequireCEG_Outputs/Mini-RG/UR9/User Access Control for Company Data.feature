Feature: User Access Control for Company Data

  As a user with access privileges
  I want to view all company data without restrictions
  So that I can perform my job without hindrance

  Background:
    Given the user has full access privileges
    And the company data is available

  Scenario: Scenario 1: Access for Full Privilege User
    Given a user with full access privileges logs into the system
    When they attempt to view company data
    Then they should see all available company data without restrictions
    And they should not receive any error messages

  Scenario: Scenario 2: Access for User with Restricted Access
    Given a user without full access privileges logs into the system
    When they try to view restricted company data
    Then they should receive an error message indicating lack of authorization

  Scenario: Scenario 3: User Lacks Access Privileges
    Given a user without the required access privileges for restricted sections logs into the system
    When they attempt to view any company data
    Then they should receive an error message indicating lack of authorization

  Scenario: Scenario 4: Restricted Access for Specific Data Types
    Given the company data has certain restrictions
    And the user has restricted access privileges
    When the user attempts to access restricted data
    Then the system should prevent access and show an error

  Scenario Outline: Scenario Outline: Restricted Data Viewing
    Given the company data has certain restrictions
    And the user has <access_level> access privileges
    When the user attempts to access <data_type>
    Then the system should <visibility>
    Examples:
      | access_level | data_type | visibility |
      | full | public data | display all data |
      | restricted | restricted data | prevent access and show error |

