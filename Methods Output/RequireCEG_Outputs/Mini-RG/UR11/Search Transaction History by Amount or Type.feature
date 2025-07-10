Feature: Search Transaction History by Amount or Type

  As a user with permission to check transaction history and keep a record
  I want to initiate a search for transaction history by specifying an amount or transaction type
  So that I can review and save relevant transaction details for my records

  Background:
    Given the user has appropriate permissions set
    And the transaction history exists in the system

  Scenario: User with permission to search and save history
    Given a user logs into the system
    And the user has permission to check transaction history
    And the user has permission to keep a record of transaction history
    When the user specifies a search criteria of transaction type 'purchase'
    Then the system displays the matching transaction history results
    And the user can save the results to their record

  Scenario: User with permission to search but not save history
    Given a user logs into the system
    And the user has permission to check transaction history
    And the user does not have permission to keep a record of transaction history
    And the user specifies a search criteria of amount $150
    When the user retrieves the transaction history
    Then the system displays the matching transaction history results
    And the system informs the user that they cannot save the results

  Scenario: User without permission to check transaction history
    Given a user logs into the system
    And the user does not have permission to check transaction history
    When the user attempts to search for transaction history
    Then the system notifications states that they do not have the necessary access rights to view transaction history

  Scenario: User with permission but insufficient criteria for saving
    Given a user logs into the system
    And the user has permission to check transaction history
    And the user has permission to keep a record of transaction history
    When the user initiates a search with insufficient criteria
    Then the system displays a message indicating insufficient criteria to retrieve results
    And the user is prompted to specify either an amount or transaction type
