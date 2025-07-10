Feature: Bank Account Login and Balance View
  As a bank account holder,
  I want to log into my bank account,
  So that I can check my account balance.

Scenario Outline: Login to bank account and view balance
  Given the username is "<username>"
  And the password is "<password>"
  When I try to log into my bank account
  Then I should <login-status>
  And I should <balance-view-status>

Examples:
  | username | password  | login-status             | balance-view-status                                  |
  | validUser | correctPwd | be logged in             | be able to view account balance                       |
  | invalidUser | wrongPwd | not be logged in         | not be able to view account balance                   |
  | validUser | incorrectPwd | not be logged in       | not be able to view account balance                   |

Scenario: View bank balance with permission
  Given I am logged into my bank account with permission to view balance
  When I request to view my account balance
  Then I should see my account balance

Scenario: Do not view bank balance without permission
  Given I am logged into my bank account without permission to view balance
  When I request to view my account balance
  Then I should not see my account balance