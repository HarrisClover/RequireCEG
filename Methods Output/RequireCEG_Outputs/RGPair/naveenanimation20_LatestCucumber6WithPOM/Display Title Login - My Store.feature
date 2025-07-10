Feature: User Authentication and Password Recovery

  As a user of the store
  I want to log in and recover my password if forgotten
  So that I can access my account securely

  Background:
    Given the user is on the login page
    And the title displayed is 'Login - My Store'

  Scenario: Successful Login with Valid Credentials
    Given the user enters the username 'dec2020secondbatch@gmail.com' and password 'Selenium@12345'
    When the user submits the login form
    Then the application validates the entered credentials
    And the user should be redirected to the Accounts page
    And the title displayed should be 'My account - My Store'

  Scenario: Password Recovery Process
    Given the user is on the login page
    When the user clicks on the 'Forgot your password?' link
    Then the application should initiate the password recovery process
    And a form should be displayed to enter the user's registered email address

  Scenario: Successful Password Recovery
    Given the application displays a form to enter the registered email address
    When the user provides their registered email address
    Then the application sends instructions for resetting the password to the provided email.

  Scenario: Invalid Credentials Login Attempt
    Given the user enters an invalid username or password
    When the user submits the login form
    Then the application validates the entered credentials
    And the user should remain on the login page
    And an error message should be displayed indicating invalid credentials
