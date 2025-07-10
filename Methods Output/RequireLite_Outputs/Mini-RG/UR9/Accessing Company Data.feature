Feature: Accessing Company Data

  As a company employee
  I want to have comprehensive access to data related to my company
  So that I can effectively gauge my company's performance

  Background:
    Given the employee holds specific access privileges that vary by role
    And the company data is classified based on sensitivity levels and access guidelines

  Scenario: Full access privileges granted
    Given the employee possesses full access privileges to the data
    When the employee tries to access the company data
    Then the employee should be able to access all company data
    And the data should not have any restrictions

  Scenario: Full access privileges not granted
    Given the employee does not possess full access privileges to the data
    When the employee tries to access the company data
    Then the employee should not be able to access any company data

  Scenario: Access with some privileges
    Given the employee has restricted access privileges to certain data types
    When the employee tries to access the company data
    Then the employee should be able to access data corresponding to their access privileges
    And the remaining company data is restricted from access

  Scenario Outline: Access based on company data restrictions
    Given the employee has <access-privilege> access privileges for <data-type>
    When the employee attempts to access the company data of type <data-type>
    Then the employee should <expected-outcome>
    And the company data has <data-restriction> restrictions
    Examples:
      | access-privilege | data-type | data-restriction | expected-outcome |
      | full | financial | none | be able to access all data |
      | none | HR | some | not be able to access the data |
      | some | operational | some | be able to access partial data |
      | limited | marketing | some | be able to access limited portions of data |

