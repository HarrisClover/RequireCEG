Feature: Withdraw Money Restrictions for Non-Adults

  As a non-adult user
  I want to withdraw money from my account and send money with limits
  So that I can manage my funds effectively without exceeding allowed limits

  Background:
    Given the user is classified by age
    And the user logs into the system

  Scenario: Adult user withdraws money
    Given the user is classified as an adult
    When the user attempts to withdraw €500
    Then the withdrawal should be approved
    And the user's account balance should be updated accordingly

  Scenario: Non-adult user attempts to withdraw money
    Given the user is classified as a non-adult
    When the user attempts to withdraw €100
    Then the withdrawal should be rejected
    And the system should display a message indicating withdrawals are only permitted for adults

  Scenario: Non-adult user attempts to send an amount less than or equal to 20 euros
    Given the user is classified as a non-adult
    And the user has €150 in their account
    When the user attempts to send €20
    Then the transaction should be approved

  Scenario: Non-adult user attempts to send an amount exceeding the limit
    Given the user is classified as a non-adult
    And the user has €150 in their account
    When the user attempts to send €25
    Then the transaction should be rejected
    And the system should display a message that the transaction exceeds the allowable limit for non-adults

  Scenario Outline: Sending money with limits for non-adults
    Given the user is classified as <user-type>
    And the user has <current-balance> in their account
    When the user attempts to send <amount> euros
    Then <expected-outcome>
    Examples:
      | user-type | current-balance | amount | expected-outcome |
      | adult | €300 | €50 | the transaction should be approved |
      | non-adult | €150 | €20 | the transaction should be approved |
      | non-adult | €150 | €25 | the transaction should be rejected and an error message displayed |

