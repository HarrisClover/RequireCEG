Feature: Transaction History Record Keeping

  As a store manager,
  I want to check transaction history and store records
  So that I can have access to past transactions whenever needed and keep track of them when necessary

  Scenario Outline: User has permission to check and record transaction history
    Given the user has permission to check transaction history
    And the user has permission to keep a record of transaction history
    When the user checks and stores the transaction history
    Then the transaction history should be available to view
    And the transaction history should be stored in the system

  Scenario Outline: User has permission to check but not record transaction history
    Given the user has permission to check transaction history
    And the user does not have permission to keep a record of transaction history
    When the user checks the transaction history
    Then the transaction history should be available to view
    And the transaction history should not be stored in the system

  Scenario Outline: User does not have permission to check transaction history
    Given the user does not have permission to check transaction history
    When the user attempts to check transaction history
    Then the transaction history should not be available to view

  Scenario Outline: User does not have permission to keep a record of transaction history
    Given the user has permission to check transaction history
    And the user does not have permission to keep a record of transaction history
    When the user attempts to store transaction history
    Then the transaction history should not be stored in the system
