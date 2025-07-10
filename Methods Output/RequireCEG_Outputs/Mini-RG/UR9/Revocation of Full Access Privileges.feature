Feature: Revocation of Full Access Privileges

  As a system administrator
  I want to manage user access to company data based on access privileges
  So that I can ensure data security and prevent unauthorized access

  Background:
    Given the user has attempted to access company data
    And the user's access privileges are verified

  Scenario: User with full access privileges
    Given the user possesses full access privilege
    When the user requests access to the company data
    Then the user should gain full access to the company data
    And there should be no access restrictions

  Scenario: User with restricted data access
    Given the user lacks full access privileges
    When the user requests access to restricted company data
    Then the user should see an 'Access Denied' message
    And it should indicate that their access request has been denied due to insufficient permissions

  Scenario: User without full access privileges trying to access unrestricted data
    Given the user lacks full access privileges
    When the user requests access to unrestricted company data
    Then the user should see an 'Access Denied' message
    And it should indicate that their access request has been denied due to insufficient permissions

  Scenario: User with restrictions attempting to access data
    Given the company data has some restrictions
    And the user possesses restricted access privileges
    When the user requests access to the company data
    Then the user should see an 'Access Denied' message
    And it should indicate that their access request has been denied due to insufficient permissions

  Scenario Outline: Scenario Outline: Accessing data with different privileges
    Given the user possesses <access-privilege>
    And the data has <restriction-status>
    When the user requests access to the company data
    Then the user should <access-outcome>
    Examples:
      | access-privilege | restriction-status | access-outcome |
      | full access | no restrictions | gain full access to the company data |
      | restricted access | restrictions | see an 'Access Denied' message |
      | no access | no restrictions | see an 'Access Denied' message |
      | full access | restrictions | gain full access to the company data |

