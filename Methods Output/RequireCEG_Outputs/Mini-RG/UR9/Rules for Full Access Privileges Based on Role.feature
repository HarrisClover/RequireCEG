Feature: Rules for Full Access Privileges Based on Role

  As a user with access privileges
  I want to manage performance-related data access
  So that I can ensure the right access levels are implemented

  Background:
    Given a user logs into the system
    And the user has specific access privileges defined

  Scenario: Full Access Granted
    Given the user has full access privileges to company data
    When the user requests to view performance-related data
    Then the user is granted the ability to view all performance-related data without restrictions
    And the system permits comprehensive viewing capabilities to the user

  Scenario: Access Denied for Limited Privileges
    Given the user does not have full access privileges
    When the user tries to access restricted performance-related data
    Then the system prevents the user from viewing the complete set of company performance data
    And an appropriate message indicating insufficient access rights is displayed

  Scenario: Partial Access Granted
    Given the user has partial access privileges
    When the user accesses data that is partly restricted
    Then the user is allowed to view only the available data points
    And the system clearly indicates which specific data the user is authorized to see

  Scenario: Access Denied for Unauthorized Data
    Given the user has partial access privileges
    When the user attempts to access restricted data points that are beyond their privileges
    Then the user is denied access
    And the system displays a message stating which specific points of data are restricted due to inadequate privileges

  Scenario: Access Control Based on User Privileges Correctly Enforced
    Given the user has partial access privileges
    And the requested data is fully restricted
    When the user tries to access the data
    Then the outcome should be access denied with specific restrictions displayed

  Scenario: Access Based on Complete Conditions
    Given the user has partial access privileges
    And the data being accessed has restrictions
    When the user tries to access the data
    Then the system allows the user to view only the available data points

  Scenario Outline: Access Control Based on User Privileges
    Given the user has <access-level> access privileges
    And the requested data is <data-status>
    When the user tries to access the data
    Then the outcome should be <expected-outcome>
    Examples:
      | access-level | data-status | expected-outcome |
      | full | unrestricted | access granted to all data |
      | limited | restricted | access denied with insufficient rights |
      | partial | partially restricted | access granted to available data points |
      | partial | fully restricted | access denied with specific restrictions displayed |

