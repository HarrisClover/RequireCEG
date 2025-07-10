Feature: User Account Management
As a user,
I want to manage my account and perform credit transactions
So that my account balance is always up-to-date.

Scenario: Perform Credit Transaction
Given the user account exists with an initial balance of <initial-balance>
When a credit transaction of <transaction-amount> is made
Then the user’s account balance should be updated to <updated-balance>

