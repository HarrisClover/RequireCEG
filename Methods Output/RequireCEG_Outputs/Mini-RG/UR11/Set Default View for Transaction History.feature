Feature: Set Default View for Transaction History

  As a user with permission to manage transaction history
  I want to set a default view that displays my transaction history with the option to save this view
  So that I can easily access and retain important transaction records for future reference

  Background:
    Given the user has logged into the system
    And the system is configured to manage transaction history permissions

  Scenario: User with permission to save transaction history
    Given the user has permission to check transaction history and keep a record
    When the user accesses the transaction history
    Then the transaction history is displayed
    And the 'Save' button is enabled

  Scenario: User without permission to save transaction history
    Given the user has permission to check transaction history but not to keep a record
    When the user accesses the transaction history
    Then the transaction history is displayed
    And the 'Save' button is disabled

  Scenario: User without permission to view transaction history
    Given the user lacks permission to view transaction history
    When the user attempts to access the transaction history
    Then the access to transaction history is denied
    And a message stating 'You do not have permission to access transaction history.' is displayed

  Scenario: User cannot have permissions simultaneously
    Given the user has permission to check transaction history
    And the user lacks permission to keep a record
    When the user attempts to access the transaction history
    Then the transaction history is displayed
    And the 'Save' button is disabled

  Scenario: User with no permissions
    Given the user lacks permission to view transaction history
    When the user attempts to access the transaction history
    Then the access to transaction history is denied
    And a message stating 'You do not have permission to access transaction history.' is displayed

  Scenario Outline: User with both permissions
    Given the user has permission to check transaction history
    And the user has permission to keep a record
    When the user sets a default view for transaction history
    Then the default view is saved successfully
    Examples:
      | user_role | permissions | default_view |
      | Admin | full permissions | transaction history with Save option |
      | Manager | check only | transaction history without Save option |
      | Guest | no permission | access denied message |

