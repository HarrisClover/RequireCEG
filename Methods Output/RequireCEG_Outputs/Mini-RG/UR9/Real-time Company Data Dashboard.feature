Feature: Real-time Company Data Dashboard

  As a user with full access privileges
  I want to view and manipulate all company data without any restrictions
  So that I can have a complete overview of all relevant information

  Background:
    Given a user logs into the system with full access privileges
    And the company data has no restrictions

  Scenario: Access Granted: Full Access
    Given the user has full access privileges
    When the user requests to view company data
    Then the user is presented with a complete overview of all relevant information

  Scenario: Access Denied: Insufficient Privileges
    Given the user does not possess full access privileges
    When the user requests to view company data
    Then the user receives a message stating 'Access Denied: Insufficient Privileges'

  Scenario: Access Restricted: Privilege Required
    Given the company data has certain restrictions
    And the user has some but not all required access privileges
    When the user attempts to access the restricted data
    Then the user receives a message stating 'Access Restricted: Privilege Required for This Section'

  Scenario: Access with No Full Privileges
    Given the user does not possess full access privileges
    When the user requests to view the company data
    Then the user receives a message stating 'Access Denied: Insufficient Privileges'

  Scenario: Access with Correct Privileges
    Given the company data has certain restrictions
    And the user possesses the correct access privileges
    When the user attempts to access the restricted data
    Then the system allows access to the necessary portions of the data

  Scenario Outline: Scenario Outline: Access with Correct Privileges
    Given the company data has certain restrictions
    And the user possesses <access-privilege> privileges
    When the user attempts to access <section>
    Then the system allows access to <section>
    Examples:
      | access-privilege | section |
      | full | financial reports |
      | limited | sales data |
      | subset | inventory details |

