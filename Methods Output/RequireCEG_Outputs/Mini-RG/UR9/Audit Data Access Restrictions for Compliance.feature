Feature: Audit Data Access Restrictions for Compliance

  As a store manager
  I want to ensure data access restrictions are properly enforced
  So that I can maintain security and compliance with company policies

  Background:
    Given the company’s data has specific access restrictions
    And users have varying levels of access privileges

  Scenario: Full access privileges granted
    Given the user possesses full access privileges
    When the user attempts to access company data
    Then the user is granted full access to the company's data
    And the access attempt is logged for compliance auditing

  Scenario: No restrictions on company data
    Given the company's data has no restrictions
    When the user accesses the company's data
    Then the user retains full access to the company's data

  Scenario: Insufficient access privileges
    Given the user lacks full access privileges
    When the user attempts to access restricted company data
    Then access is denied
    And a warning message indicating the denial of access is generated

  Scenario: Access granted with appropriate privileges
    Given the user has appropriate access privileges for the restricted data
    When the user attempts to access that restricted data
    Then the user is granted access to the restricted data

  Scenario: Access Denial Logging
    Given the user lacks full access privileges
    When the user attempts to access a restricted resource
    Then the access attempt is denied
    And the access attempt is logged for compliance auditing with a warning message generated

  Scenario Outline: Scenario Outline: Access Attempt
    Given the user has <access-privileges>
    And the company's data has <data-restriction>
    When the user attempts to access the data
    Then the user should receive <access-outcome>
    And <consequence>
    Examples:
      | access-privileges | data-restriction | access-outcome | consequence |
      | full access | no restrictions | full access | logged operation |
      | restricted access | specific restrictions | access denied | warning message generated |
      | insufficient access | specific restrictions | access denied | access attempt logged |

