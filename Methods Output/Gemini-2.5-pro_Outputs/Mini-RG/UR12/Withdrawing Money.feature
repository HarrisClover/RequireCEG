Feature: Withdrawing Money
  As a user (adult or non-adult)
  I want to withdraw money according to age-based rules
  So that I can manage my funds for business transactions.

  Scenario: Adult user withdraws money successfully
    Given an "adult" user is logged into the system
    And the user has a balance of 100 euros
    When the user attempts to withdraw 50 euros
    Then the withdrawal should be successful
    And the user's balance should be 50 euros

  Scenario: Non-adult user attempts to withdraw money
    Given a "non-adult" user is logged into the system
    And the user has a balance of 100 euros
    When the user attempts to withdraw 30 euros
    Then the withdrawal should be rejected
    And an error message indicating non-adults cannot withdraw should be shown
    And the user's balance should remain 100 euros