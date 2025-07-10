Feature: Store Transaction Records with Metadata

  As a user with permission to check transaction history
  I want to be able to view and save transaction history
  So that I can keep a record of past transactions

  Background:
    Given the user has permission to check transaction history
    And the user has permission to keep a record of the transaction history

  Scenario: User views and saves transaction history
    Given the user logs into the system
    And the user accesses transaction history
    When the user chooses to save the transaction history
    Then the system saves the transaction history
    And the message 'Transaction history saved successfully' is displayed

  Scenario: User can only review transaction history
    Given the user logs into the system
    And the user has permission to check transaction history but not to save it
    When the user accesses transaction history
    Then the user reviews the transaction history
    And the message 'You cannot save the transaction history.' is displayed

  Scenario: User lacks permission to check history
    Given the user logs into the system
    When the user attempts to access transaction history
    Then the user is denied access
    And the message 'You do not have permission to view transaction history.' is displayed

  Scenario: User can only save without checking
    Given the user logs into the system
    And the user has permission only to keep records without checking
    When the user retrieves previously reviewed transaction history
    Then the user saves the transaction history
    And the message 'Transaction history saved successfully' is displayed

  Scenario: User checks without intention to save
    Given the user logs into the system
    And the user has permission to check but not to save transaction history
    When the user views transaction history
    Then the user can see the transaction records
    And the reminder 'Remember, you are not saving this record.' is displayed

  Scenario: User lacks permission to save transaction history
    Given the user logs into the system
    And the user has permission to check transaction history but has explicitly chosen not to save it
    When the user attempts to save the transaction history
    Then the user is shown the message 'You cannot save the transaction history.'
    And the transaction history is not saved

  Scenario: User has permission to save but not check transaction history
    Given the user logs into the system
    And the user has permission to save transaction history without checking it
    When the user retrieves previously reviewed transaction history
    Then the user saves the transaction history
    And the message 'Transaction history saved successfully' is displayed
