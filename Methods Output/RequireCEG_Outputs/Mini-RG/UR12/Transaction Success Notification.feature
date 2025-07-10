Feature: Transaction Success Notification

  As a user
  I want to send and withdraw money based on my age classification
  So that I can successfully manage my transactions while receiving appropriate notifications

  Background:
    Given a user is logged into the system
    And the user has provided their age classification

  Scenario: Adult Sending Money
    Given the user is classified as an adult
    When the user sends $100
    Then a notification is sent indicating the transaction's success

  Scenario: Adult Withdrawing Money
    Given the user is classified as an adult
    When the user withdraws $50
    Then a notification is sent confirming the withdrawal

  Scenario: Non-Adult Sending Money within Limit
    Given the user is classified as a non-adult
    When the user sends €20
    Then a notification is sent indicating the transaction's success

  Scenario: Non-Adult Sending Money above Limit
    Given the user is classified as a non-adult
    When the user attempts to send €25
    Then the system displays an error message preventing the transaction

  Scenario: Non-Adult Sending Money Attempt
    Given the user is classified as a non-adult
    And the user attempts to send €10
    When the transaction is processed
    Then the system sends a notification indicating success

  Scenario: Non-Adult Sending Money Attempt
    Given the user is classified as a non-adult
    And the user attempts to send €20
    When the transaction is processed
    Then the system sends a notification indicating success

  Scenario: Non-Adult Sending Money Attempt
    Given the user is classified as a non-adult
    And the user attempts to send €30
    When the transaction is processed
    Then the system displays an error message preventing the transaction

  Scenario: Transaction Success Notification for Adult
    Given the user is classified as an adult
    And the transaction for the adult user is successful
    When the user tries to perform a transaction
    Then a notification is sent indicating the transaction's success
    And the withdrawal by the adult user is successful

  Scenario: Notification for Non-Adult Success
    Given the user is classified as a non-adult
    And the transaction for the non-adult user is successful
    When the user tries to perform a transaction
    Then a notification is sent indicating the transaction's success
