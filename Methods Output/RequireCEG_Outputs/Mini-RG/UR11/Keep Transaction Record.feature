Feature: Keep Transaction Record

  As a user with specific permissions
  I want to access and manage transaction history
  So that I can track transaction details and maintain records accordingly

  Background:
    Given the user has given permissions set
    And the system is ready to respond based on those permissions

  Scenario: Scenario 1: User can check and keep record
    Given the user has permission to check transaction history
    And the user has permission to keep a record
    When the user requests to view transaction history
    Then the system displays the transaction history
    And the system presents a save option to store the history

  Scenario: Scenario 2: User can check but not keep record
    Given the user has permission to check transaction history
    And the user does not have permission to keep a record
    When the user requests to view transaction history
    Then the system displays the transaction history
    And the system omits the save option

  Scenario: Scenario 3: User cannot check transaction history
    Given the user does not have permission to check transaction history
    When the user requests to view transaction history
    Then the system shows a message indicating permission is denied for reviewing transaction history

  Scenario: Scenario 4: User can keep a record but not check history
    Given the user has permission to keep a record
    And the user does not have permission to check transaction history
    When the user attempts to maintain records
    Then the system notifies the user that they cannot access the transaction history to maintain records

  Scenario: Scenario 5: User lacks permission to check the history
    Given the user lacks permission to check transaction history
    When the user tries to check transaction history
    Then the system indicates that permission is denied for checking transaction history

  Scenario: Scenario 6: User can keep a record but is denied checking
    Given the user has permission to keep a record
    And the user lacks permission to check transaction history
    When the user attempts to maintain records
    Then the system informs the user that they are unable to access transaction history for this purpose
