Feature: Notify User of Permission Denied for Record Keeping

  As a user
  I want to manage transaction history records based on my permissions
  So that I can know what actions I am allowed to perform

  Background:
    Given a user with specific permissions regarding transaction history
    And the system is set up to check user permissions

  Scenario: User without permission to keep a record attempts to save transaction history
    Given the user has no permission for record keeping
    When the user tries to save transaction history
    Then the system should display a message notifying the user that permission has been denied for record keeping

  Scenario: User with permission to check history but not to keep records
    Given the user has permission to check transaction history but no permission for record keeping
    When the user views the transaction history
    Then the system should allow the user to view the transaction history
    And the system should inform them that they cannot save this information

  Scenario: User with full permissions checks and saves transaction history
    Given the user has permission to check transaction history and keep a record
    When the user views and saves the transaction history
    Then the system should enable the user to perform both actions seamlessly

  Scenario: User without any permissions related to transaction history
    Given the user has no permissions related to transaction history
    When the user attempts to access transaction history
    Then the system should provide a notification indicating that they cannot access transaction history in any capacity

  Scenario: User lacks permission but tries to check transaction history
    Given the user lacks permission for record keeping
    When the user attempts to view transaction history
    Then the system should notify the user that they are unable to access transaction history in any capacity
