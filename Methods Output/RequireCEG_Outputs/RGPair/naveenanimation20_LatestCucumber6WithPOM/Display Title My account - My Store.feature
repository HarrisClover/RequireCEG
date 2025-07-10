Feature: Display Title 'My account - My Store'

  As a user
  I want to log into my account and see my account title
  So that I can confirm that I am logged in successfully

  Background:
    Given the user has valid credentials with username 'dec2020secondbatch@gmail.com' and password 'Selenium@12345'
    And the title of the Accounts page is displayed

  Scenario: Scenario 1: Successful Login
    Given the user is on the Login page
    When the user logs in with valid credentials
    Then the title 'My account - My Store' should be displayed on the Accounts page

  Scenario: Scenario 2: Redirect to Login Page
    Given the user is not logged in
    When the user navigates to the Accounts page
    Then the user should be redirected to the Login page
    And the title 'Login - My Store' should be displayed along with 'Forgot your password?' link

  Scenario: Scenario 3: Login with Invalid Credentials
    Given the user submits the login form with username 'wronguser@gmail.com' and password 'wrongpassword'
    When the system validates the credentials against the database
    Then the user should see an error message for unsuccessful login attempt due to invalid credentials

  Scenario: Scenario 4: Validating Successful and Unsuccessful Login
    Given the user submits the login form with username 'dec2020secondbatch@gmail.com' and password 'Selenium@12345'
    When the system validates the credentials against the database
    Then the user should be directed to the Accounts page if credentials match
    And if the credentials do not match, an error message should be displayed for unsuccessful login attempt due to invalid credentials

  Scenario Outline: Scenario Outline: Login Credential Validation
    Given the user submits the login form with username '<username>' and password '<password>'
    When the system validates the credentials against the database
    Then the user should be directed to the Accounts page if credentials match
    And the user should see an error message for unsuccessful login attempt due to invalid credentials if credentials do not match
    Examples:
      | username | password |
      | dec2020secondbatch@gmail.com | Selenium@12345 |
      | wronguser@gmail.com | wrongpassword |
      | anotheruser@example.com | correctpassword |

