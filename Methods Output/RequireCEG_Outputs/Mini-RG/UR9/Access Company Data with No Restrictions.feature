Feature: Access Company Data with No Restrictions

  As a store owner
  I want to access all company data without restrictions
  So that I can view all performance metrics associated with the company

  Background:
    Given the user has full access privilege to the data
    And the system is initialized for user access

  Scenario: Scenario 1: Full Access to Company Data
    Given the user logs in with full access privileges
    And the company data is available
    When the user requests access to performance metrics
    Then the user should see the entire set of performance data
    And no messages or barriers should be presented

  Scenario: Scenario 2: Access Denied for Insufficient Privileges
    Given the user attempts to access data without full access privileges
    When the user requests access to restricted performance metrics
    Then the system should deny access
    And display the message: 'Access Denied: You do not have the required privileges to view this data.'

  Scenario: Scenario 3: Limited Access to Data
    Given the user has partial access privileges
    When the user attempts to access restricted performance metrics
    Then the system should provide access to specified data points
    And display the message: 'You have access to limited data as per your privileges.'

  Scenario: Scenario 4: Attempting Access with Mismatched Privileges
    Given the user is attempting to access data with privileges that do not match the requirements
    When the user requests access to the data
    Then the system should deny access
    And display the message: 'Access Denied: You do not have the required privileges to view this data.'

  Scenario Outline: Scenario Outline: Access Privileges and Data Levels
    Given the user access level is <access-level>
    And the requested data level is <data-level>
    When the user requests access to the metrics
    Then the system should <expected-outcome>
    Examples:
      | access-level | data-level | expected-outcome |
      | full | all metrics | allow access to all performance data |
      | partial | restricted metrics | allow access to specified data points and show limited access message |
      | none | restricted metrics | deny access and show access denied message |

