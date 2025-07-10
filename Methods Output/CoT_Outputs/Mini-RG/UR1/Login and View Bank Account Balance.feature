Feature: Login and View Bank Account Balance
  As a user,
  I want to log in to my bank account
  So that I can check my bank account balance based on my permissions.

Scenario Outline: User logs in and views their bank balance
  Given I have the username "<username>" and password "<password>"
  And the user has permission to view the account balance as "<has_permission>"
  When I log into the system
  Then I should be able to see my bank account balance if "<expected_balance_visible>" is true
  And I should not be able to see my bank account balance if "<expected_balance_visible>" is false

Examples:
  | username       | password       | has_permission | expected_balance_visible |
  | correctUser    | correctPass    | true           | true                     |
  | correctUser    | correctPass    | false          | false                    |
  | incorrectUser  | correctPass    | true           | false                    |
  | correctUser    | incorrectPass  | true           | false                    |
