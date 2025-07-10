Feature: User Account Credit Transactions
  As a system user,
  I want to perform credit transactions
  So that my account balance is accurately updated

  Scenario: Successful credit transaction updates account balance
    Given a user account exists with an initial balance of "$1000"
    When the user performs a credit transaction of "$200"
    Then the updated account balance should be "$1200"

