Feature: Implement Data Access Restrictions

  As a user with access privileges
  I want to access the company data with respect to my access level
  So that I can work effectively without encountering access issues

  Background:
    Given a user is logged into the system
    And the company data has predefined access restrictions

  Scenario: User with full access privileges
    Given the user has full access privilege
    And the company data has access restrictions
    When the user attempts to access the company data
    Then the user should retain complete access to the data
    And the system should notify the user that they are granted complete access to the company data

  Scenario: User without full access privileges
    Given the user lacks full access privilege
    When the user attempts to access the company data
    Then the user should not be granted access to the company data
    And the system should notify the user that they are denied access due to lack of privileges

  Scenario: User with restricted access privileges
    Given the user has limited access privileges
    And the company data has access restrictions
    When the user attempts to access the company data
    Then the system should inform the user that limited access is granted

  Scenario: User with no access privileges
    Given the user has no access privilege
    And the company data has access restrictions
    When the user attempts to access the company data
    Then the system should inform the user that no access is granted

  Scenario: User with full access but restricted data
    Given the user has full access privilege
    And the company data has access restrictions
    When the user attempts to access restricted company data
    Then the system should notify the user that they are informed they have full access regardless of restrictions

  Scenario Outline: User with partial access privileges to restricted data
    Given the user has <access-privilege> access privileges
    And the company data has <data-restrictions>
    When the user attempts to access the company data
    Then the system should inform the user that <access-status>
    Examples:
      | access-privilege | data-restrictions | access-status |
      | limited | access restrictions | limited access granted |
      | none | access restrictions | no access granted |
      | full | no access restrictions | full access granted |

