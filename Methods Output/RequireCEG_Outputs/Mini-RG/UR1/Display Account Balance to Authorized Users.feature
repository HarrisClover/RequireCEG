Feature: Display Account Balance to Authorized Users

  As a store owner
  I want to ensure that only authorized users can view the account balance
  So that I can protect sensitive financial information

  Background:
    Given a user with specific permissions
    And the user is logged into the system

  Scenario: Scenario 1: Authorized user can view account balance
    Given the user has permission to view the account balance
    When the user requests to view their account balance
    Then the system displays the current bank account balance
    And the system confirms successful retrieval of account information

  Scenario: Scenario 2: Unauthorized user cannot view account balance
    Given the user does not have permission to view the account balance
    When the user attempts to access their account balance
    Then the system prevents access to the account balance information
    And the system displays a message informing them of their lack of permission

  Scenario: Scenario 3: User with no permission attempts to access account balance
    Given the user does not have permission to view the account balance
    When the user tries accessing their account balance
    Then the system notifies the user that they do not have permission to view account balance
    And the system logs the unauthorized access attempt.

  Scenario Outline: Scenario Outline: Access account balance based on permissions
    Given the user has <permission> permission
    When the user tries to view their account balance
    Then the system <expectedOutcome>
    Examples:
      | permission | expectedOutcome |
      | permission | displays the current bank account balance |
      | no permission | prevents access and informs the user |

