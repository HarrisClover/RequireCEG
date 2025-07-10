Feature: Enable Or Disable Notifications for Transaction Changes

  As a user with certain permissions
  I want to manage notifications for transaction changes
  So that I can keep track of my transaction history effectively

  Background:
    Given that a user has a specific permission level
    And the system is configured to send notifications

  Scenario: User has permission and can save records
    Given the user has permission to check transaction history
    When a transaction change occurs
    Then the system sends notifications for the transaction change
    And the user can save these records

  Scenario: User has permission but cannot save records
    Given the user has permission to check transaction history
    And the user does not have the ability to keep a record
    When a transaction change occurs
    Then the system sends notifications for the transaction change
    And an appropriate message is displayed indicating the disabling of save functionality

  Scenario: User lacks permission to check transaction history
    Given the user does not have permission to check transaction history
    When a transaction change occurs
    Then no notifications are sent for transaction changes

  Scenario: User opts to disable notifications
    Given the user opts to disable notifications for transaction changes
    When the system processes this request
    Then all notifications related to transaction changes are halted immediately
    And a confirmation message is displayed upon successful disabling of notifications

  Scenario: User disables notifications with a pending transaction
    Given the user opts to disable notifications for transaction changes
    And a pending transaction change occurs
    When the system processes this confirmation
    Then a confirmation message is displayed upon successful disabling of notifications
    And no further notifications for transaction changes are sent

  Scenario: User attempts to check transaction history without permissions
    Given the user does not have permission to check transaction history
    When the user attempts to check the transaction history
    Then the system denies access with a specific error message
