Feature: User Authentication for Financial Transactions

  As a store owner or system administrator
  I want to enforce age verification for users before allowing them to send or withdraw funds
  So that I can ensure responsible usage and compliance with regulations for financial transactions

  Background:
    Given a user attempts to perform a financial transaction
    And the user’s age is verified by the system

  Scenario: Scenario 1: Adult user processing a transaction
    Given the user is authenticated as an adult
    When the user attempts to send €50
    Then the transaction is processed successfully
    And the user receives a confirmation message

  Scenario: Scenario 2: Non-adult user attempting a transaction above limit
    Given the user is identified as a non-adult
    When the user attempts to send €25
    Then the transaction fails
    And the system displays a message indicating that the transaction exceeds the allowed limit for non-adults

  Scenario: Scenario 3: Non-adult user authentication failure
    Given the user attempts to send or withdraw money without authentication
    When the transaction is processed
    Then the transaction fails
    And the system implements strict authentication checks to ensure accurate categorization of users

  Scenario: Scenario 4: Successful transaction by a non-adult within limit
    Given the user is authenticated as a non-adult
    When the user attempts to send €15
    Then the transaction is processed successfully
    And the user receives a confirmation message
