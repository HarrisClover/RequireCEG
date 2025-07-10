Feature: Grant Record Keeping Permission

  As a user with varying permission levels
  I want to manage my access to transaction history and its record-keeping
  So that I can view or save transaction details based on my permission level

  Background:
    Given the user has a defined permission level regarding transaction history
    And the user is logged into the system

  Scenario: Scenario 1: Full Permission User
    Given the user has full permission
    When the user attempts to view the transaction history
    Then the transaction history should be displayed
    And the user can keep a record of the transaction history

  Scenario: Scenario 2: Limited Permission User
    Given the user has limited permission
    When the user attempts to view the transaction history
    Then the transaction history should be displayed
    And the user receives a message 'You cannot save the transaction history.' when trying to save it

  Scenario: Scenario 3: No Permission User
    Given the user has no permission
    When the user attempts to access the transaction history
    Then the user receives a message 'Access denied. You do not have permission to view the transaction history.'

  Scenario: Scenario 4: User Attempts to Save with No Permission
    Given the user has no permission
    When the user attempts to save the transaction history
    Then the system presents the message 'Access denied. You do not have permission to view the transaction history.'

  Scenario: Scenario 5: User Attempts to Save with Limited Permission
    Given the user has limited permission
    When the user attempts to save the transaction history
    Then the system presents the message 'You cannot save the transaction history.'

  Scenario Outline: Scenario Outline: Permission Levels
    Given the user has <permission> permission
    When the user attempts to view transaction history
    Then the system responds according to the defined rules based on <permission>
    Examples:
      | permission | expected_outcome |
      | full | display transaction history and allow recording |
      | limited | display transaction history but deny recording |
      | none | deny access to transaction history |

