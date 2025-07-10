Feature: Define Full Access Privileges

  As a user with full access privileges
  I want to be granted unconditional access to all company data
  So that I can utilize all information without restrictions

  Background:
    Given the user has full access privileges
    And the company data is restricted

  Scenario: Scenario 1: Unrestricted Access with Full Privileges
    Given the user has full access privileges
    And the company data is unrestricted
    When the user attempts to access company data
    Then the user should be granted full access
    And no additional conditions apply

  Scenario: Scenario 2: Restricted Access without Full Privileges
    Given the user lacks full access privileges
    When the user attempts to access company data
    Then access should be denied
    And prevent access to all company data

  Scenario: Scenario 3: Restricted Access with Necessary Privileges
    Given the user has necessary access privileges but not full access
    And the company data has restrictions
    When the user attempts to access specific company data
    Then the user should be granted access to that specific company's data
    And a message informing the user of their access status should be displayed

  Scenario: Scenario 4: Denied Access with Lack of Privileges
    Given the user lacks full access privileges
    When the user attempts to access restricted company data
    Then the user should be denied access
    And a message should be displayed informing them of insufficient privileges

  Scenario Outline: Scenario Outline: Access Based on Privileges and Data Status
    Given the user has <access-privileges>
    And the company data is <data-status>
    When the user attempts to access the company data
    Then the user should <access-outcome>
    Examples:
      | access-privileges | data-status | access-outcome |
      | full access | unrestricted | be granted full access |
      | full access | restricted | be granted full access |
      | lacking full access | unrestricted | be denied access |
      | lacking full access | restricted | be denied access |
      | necessary privileges | restricted | be granted access to specific company data |

