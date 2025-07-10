Feature: Grant Transaction History Check Permission

  As a user with transaction history check permission
  I want to view transaction records
  So that I can review past transactions

  Background:
    Given the user has permission to check transaction history
    And the user does not have permission to keep a record

  Scenario: Scenario 1: View Transaction History Without Save Permission
    Given the user logs into the system
    And the user attempts to access transaction history
    When the user views the transaction history
    Then the transaction records are displayed
    And the option to save the records is disabled

  Scenario: Scenario 2: View and Save Transaction History
    Given the user has permission to check transaction history
    And the user has permission to keep a record
    When the user views the transaction history
    Then the transaction records are displayed
    And the option to save the records is enabled

  Scenario: Scenario 3: Access Denied for Transaction History
    Given the user does not have permission to check transaction history
    When the user tries to access transaction history
    Then access to view transaction history is denied
    And a message 'Access Denied' is displayed

  Scenario: Scenario 4: Disable Save Option for No Record Permission
    Given the user has permission to check transaction history
    And the user does not have permission to keep a record
    When the user attempts to view transaction history
    Then the transaction records are displayed
    And the option to save the records is disabled

  Scenario Outline: Scenario Outline: Viewing Transaction History
    Given the user has permission to check transaction history <permission>
    And the user has permission to keep a record <recordPermission>
    When the user attempts to view transaction history
    Then the user sees <viewOutcome>
    And the user can <saveOutcome>
    Examples:
      | permission | recordPermission | viewOutcome | saveOutcome |
      | yes | yes | the transaction records are displayed | the option to save the records is enabled |
      | yes | no | the transaction records are displayed | the option to save the records is disabled |
      | no | - | access to view transaction history is denied | N/A |

