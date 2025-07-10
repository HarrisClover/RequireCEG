Feature: Age Verification

  As a system user
  I want to ensure appropriate restrictions are applied based on age
  So that financial transactions are compliant with age-related regulations

  Background:
    Given the user is on the transaction page
    And the user has provided their age

  Scenario: Scenario 1: Adult user making a transaction
    Given the user is 18 years or older
    When the user attempts to send 100 euros
    Then the transaction should be processed successfully
    And the user should be able to withdraw funds without restrictions

  Scenario: Scenario 2: Minor user sending limited amount
    Given the user is under 18 years
    When the user attempts to send 15 euros
    Then the transaction should be processed successfully
    And the user should receive no age-related restriction message

  Scenario: Scenario 3: Minor user exceeding send limit
    Given the user is under 18 years
    When the user attempts to send 25 euros
    Then the transaction should fail
    And the system displays an error message indicating the maximum limit of 20 euros

  Scenario: Scenario 4: Minor user attempting to withdraw funds
    Given the user is under 18 years
    When the user attempts to withdraw 50 euros
    Then the transaction should fail
    And the system displays an error message indicating that withdrawal is not allowed for users under 18

  Scenario: Scenario 5: Adult user attempting to withdraw funds
    Given the user is 18 years or older
    When the user attempts to withdraw 50 euros
    Then the transaction should be processed successfully
    And the user should receive no age-related restriction message

  Scenario Outline: Scenario Outline: Age-based transaction validation
    Given the user is <age> years old
    When the user attempts to send <amount> euros
    Then the transaction should <transactionOutcome>
    And the system should <messageOutcome>
    Examples:
      | age | amount | transactionOutcome | messageOutcome |
      | 17 | 15 | be processed successfully | not display an error message |
      | 17 | 25 | fail | display an error message indicating the maximum limit of 20 euros |
      | 18 | 30 | be processed successfully | not display an error message |

