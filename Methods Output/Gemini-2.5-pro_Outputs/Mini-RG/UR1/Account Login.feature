Feature: Account Login
  As a Customer
  I want to login to my bank account
  So that I can access my account services

  Scenario: Successful Login
    Given a customer has an account with username "correct_user" and password "correct_pass"
    When the customer attempts to login with username "correct_user" and password "correct_pass"
    Then the customer should be logged in successfully

  Scenario Outline: Unsuccessful Login
    Given a customer has an account with username "correct_user" and password "correct_pass"
    When the customer attempts to login with username "<username>" and password "<password>"
    Then the customer should not be logged in
    And an error message "Invalid username or password" should be displayed

    Examples:
      | username       | password       | Description        |
      | wrong_user     | correct_pass   | Incorrect Username |
      | correct_user   | wrong_pass     | Incorrect Password |
      | wrong_user     | wrong_pass     | Both Incorrect     |
      | correct_user   |                | Empty Password     |
      |                | correct_pass   | Empty Username     |

