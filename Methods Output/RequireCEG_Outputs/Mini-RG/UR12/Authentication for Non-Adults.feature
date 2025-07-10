Feature: Authentication for Non-Adults

  As a user
  I want to verify my age before making transactions
  So that I can adhere to the transaction limits set for non-adults

  Background:
    Given a user attempts to access the transaction system
    And the user is prompted to enter their age for verification

  Scenario: Valid age entry for adults
    Given the user enters a valid age of 18 or older
    When the system verifies the age
    Then the user is authenticated as an adult
    And the system allows the user to send any amount of money without restrictions

  Scenario: Underage user attempts transaction
    Given the user enters a valid age under 18
    When the system verifies the age
    Then the user is notified of their age restriction
    And the user is assigned a transaction limit of 20 euros

  Scenario: Exceeding transaction limit for non-adults
    Given the user is authenticated as a non-adult
    When the user attempts to send an amount greater than 20 euros
    Then the system prevents the transaction
    And the user is shown the message 'Transaction limit exceeded for non-adults'

  Scenario: Valid transaction attempt within limit for non-adults
    Given the user is authenticated as a non-adult
    When the user attempts to send an amount of 20 euros or less
    Then the transaction is processed successfully
    And the user is shown a success message

  Scenario Outline: Transaction attempt by non-adult
    Given the user enters their age as <age>
    When the user wants to send <amount> euros
    Then the system should <outcome>
    Examples:
      | age | amount | outcome |
      | 17 | 25 | prevent the transaction and show message |
      | 16 | 15 | allow the transaction |
      | 15 | 30 | prevent the transaction and show message |
      | 19 | 10 | allow the transaction |
      | 14 | 20 | prevent the transaction and show message |

