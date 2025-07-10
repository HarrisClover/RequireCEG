Feature: View Account Balance
  As a Customer
  I want to check my bank account balance
  So that I know my current financial status

  Scenario: View Account Balance Successfully
    Given the customer is logged in
    And the customer has permission to view their account balance
    And the customer's account balance is $5000.00
    When the customer requests to view their account balance
    Then the customer should see the account balance as $5000.00

  Scenario: Attempt to View Account Balance Without Permission
    Given the customer is logged in
    And the customer does not have permission to view their account balance
    When the customer attempts to view their account balance
    Then the customer should not see the account balance
    And a "Permission Denied" message or equivalent restriction should be displayed

  # Optional: Scenario covering the case where the user is not logged in at all
  Scenario: Attempt to View Account Balance When Not Logged In
    Given the customer is not logged in
    When the customer attempts to view their account balance
    Then the customer should be prompted to log in or shown a login page
    And the account balance should not be displayed