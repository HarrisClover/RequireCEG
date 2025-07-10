Feature: View Transaction History

  As a user
  I want to view my transaction history
  So that I can keep track of my spending

  Background:
    Given the user is logged into their account
    And the user's age is retrieved from their profile

  Scenario: Scenario 1: Adult user views full transaction history
    Given the user is identified as an adult
    When the user requests to view their transaction history
    Then the system should display all transactions associated with the user's account

  Scenario: Scenario 2: Non-adult user views filtered transaction history
    Given the user is identified as a non-adult
    When the user requests to view their transaction history
    Then the system should display transactions where the amounts do not exceed 20 euros

  Scenario: Scenario 3: Non-adult user with no valid transactions
    Given the user is identified as a non-adult
    When the user requests to view their transaction history
    Then the system should display a message indicating there are no transactions available for viewing

  Scenario: Scenario 4: Non-adult user with transactions exceeding 20 euros
    Given the user is identified as a non-adult
    And the user's transaction history includes transactions with amounts exceeding 20 euros
    When the user requests to view their transaction history
    Then the system should display transactions where the amounts do not exceed 20 euros

  Scenario: Scenario 5: Non-adult user with no transaction history
    Given the user is identified as a non-adult
    And the user's transaction history contains no records
    When the user requests to view their transaction history
    Then the system should display a message indicating there are no transactions available for viewing
