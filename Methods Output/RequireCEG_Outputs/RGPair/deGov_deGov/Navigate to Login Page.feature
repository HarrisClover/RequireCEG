Feature: Navigate to Login Page

  As an anonymous user
  I want to access the login page
  So that I can log into my account

  Background:
    Given an anonymous user accesses the start page
    And the system displays an option labeled 'Login' prominently

  Scenario: Scenario 1: Successful Login
    Given the user selects the 'Login' option
    When the user submits valid credentials
    Then the system grants access to the dashboard
    And a welcome message is displayed

  Scenario: Scenario 2: Failed Login Attempt
    Given the user selects the 'Login' option
    When the user submits invalid credentials
    Then the system presents an error message
    And provides options to try again or reset the password

  Scenario: Scenario 3: Navigating Back to Start Page After Failed Login Attempt
    Given the user is on the login page
    When the user chooses to navigate back
    Then the system allows a seamless return to the start page
    And the login option and sitemap are easily accessible

  Scenario: Scenario 4: Anonymous User Access
    Given the user is an anonymous user accessing the start page
    Then the system displays the 'Login' option prominently

  Scenario: Scenario 5: User Submitting Credentials
    Given the user selects the 'Login' option
    When the user submits their username and password
    Then the system validates the submitted credentials against the stored user data

  Scenario: Scenario 6: Error After Incorrect Credentials
    Given the user selects the 'Login' option
    When the user submits incorrect credentials
    Then the system presents an error message indicating the login attempt has failed
    And provides options to try again or reset the password
