Feature: Check Current Permissions

  As a user
  I want to check my permissions for accessing transaction history
  So that I can understand what actions I am allowed to perform

  Background:
    Given the system has permission settings configured
    And the user has logged into the system

  Scenario: Scenario 1: User has permission to view and save transaction history
    Given the user has permission to check transaction history
    And the user has permission to keep a record of the transaction history
    When the user requests to view transaction history
    Then the transaction history should be displayed
    And the user should receive a confirmation message indicating that the history has been saved successfully

  Scenario: Scenario 2: User has permission to view but not save transaction history
    Given the user has permission to check transaction history
    And the user does not have permission to keep a record of the transaction history
    When the user requests to view transaction history
    Then the transaction history should be displayed
    And the user should receive a message stating that saving is not permitted

  Scenario: Scenario 3: User lacks permission to check transaction history
    Given the user does not have permission to check transaction history
    When the user attempts to view transaction history
    Then access should be denied
    And a message indicating that permission is required should be displayed

  Scenario: Scenario 4: User has permission to view and save transaction history but permissions are updated to view only before access request is made (using mutual exclusion logic). The user will see the consequences of the update on their transaction history requests (logic expectation).
    Given the user had initial permissions set to view and save transaction history
    And the user's permissions are updated to view only before the user's request
    When the user requests to view transaction history
    Then the transaction history should be displayed
    And the user should receive a message indicating saving is not permitted
