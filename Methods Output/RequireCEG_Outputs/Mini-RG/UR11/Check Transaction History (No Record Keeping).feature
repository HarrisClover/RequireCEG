Feature: Check Transaction History (No Record Keeping)

  As a user
  I want to access my transaction history
  So that I can review my past transactions

  Background:
    Given the user is logged into the system
    And the user has relevant permissions

  Scenario: User with permission to view but not save records
    Given the user has permission to check transaction history
    And the user does not have permission to save records
    When the user attempts to access the transaction history
    Then the transaction history is displayed
    And the message 'You have access to view transaction history, but cannot save records.' is shown

  Scenario: User without permission to view transaction history
    Given the user does not have permission to check transaction history
    When the user attempts to access the transaction history
    Then the message 'Access denied: You do not have permission to view transaction history.' is shown

  Scenario: User with permission to view and save records but only has view permission
    Given the user has permission to check transaction history
    And the user does not have permission to save records
    When the user attempts to save the transaction history
    Then the message 'You do not have the necessary permissions to save records. Please check your access rights.' is shown

  Scenario: User without permission to access transaction history
    Given the user does not have permission to check transaction history
    When the user attempts to access the transaction history
    Then the message 'Access denied: You do not have permission to view transaction history.' is shown

  Scenario: User with permission to view transaction history and an attempt to save record
    Given the user has permission to check transaction history
    And the user has permission to save records
    When the user attempts to access the transaction history
    Then the transaction history is displayed
    And the functionality for saving records is enabled

  Scenario: User attempting to save a transaction history without permission
    Given the user has permission to check transaction history
    And the user does not have permission to save records
    When the user attempts to save the transaction history
    Then the message 'You do not have the necessary permissions to save records. Please check your access rights.' is shown
