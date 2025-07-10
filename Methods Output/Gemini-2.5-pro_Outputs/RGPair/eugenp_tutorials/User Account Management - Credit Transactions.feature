Feature: User Account Management - Credit Transactions
  As an API Client
  I want to perform credit transactions on user accounts
  So that account balances are accurately updated

  Scenario: Successfully credit a user account
    Given a user account "user123" exists with a balance of $100.00
    When a credit transaction of $50.50 is posted for account "user123" via API
    Then the transaction should be successful
    And the updated balance for account "user123" should be $150.50

  Scenario: Attempt to credit a non-existent user account
    Given a user account "user999" does not exist
    When a credit transaction of $25.00 is posted for account "user999" via API
    Then the transaction should fail
    And an appropriate error message indicating "Account not found" should be returned
