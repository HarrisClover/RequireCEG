Feature: Registration Process

  As a user
  I want to register an account
  So that I can access the system features

  Background:
    Given the user is on the registration page
    And the user has a stable internet connection

  Scenario: Scenario 1: Successful Registration
    Given the user fills in all required fields correctly
    When the user submits the registration form
    Then the user is registered successfully
    And the user is redirected to the login page with a success message

  Scenario: Scenario 2: Invalid Email Format
    Given the user fills in the registration form with an invalid email format
    When the user submits the registration form
    Then the system shows an error message specifying the email field requires correction

  Scenario: Scenario 3: Missing Required Fields
    Given the user leaves one or more required fields empty in the registration form
    When the user submits the registration form
    Then the system shows error messages indicating which fields require correction

  Scenario: Scenario 4: Email Already in Use
    Given the user attempts to register with an email address already associated with an existing account
    When the user submits the registration form
    Then the system displays an error message indicating the email is already in use

  Scenario: Scenario 5: JavaScript Disabled
    Given the user has JavaScript disabled in their browser
    When the user attempts to register
    Then the system displays an instructive message advising the user to enable JavaScript for successful registration

  Scenario: Scenario 6: Multiple JavaScript Disabled Attempts
    Given the user has JavaScript disabled in their browser
    When the user attempts to register multiple times
    Then the system displays an instructive message advising the user to enable JavaScript for successful registration on each attempt

  Scenario Outline: Scenario Outline: Multiple User Registration Attempts
    Given the user fills in the registration form with <email>
    And the user provides <required fields>
    When the user submits the registration form
    Then the system should display <outcome>
    Examples:
      | email | required fields | outcome |
      | test@example.com | valid data | user is registered successfully |
      | invalid-email | missing name | error message regarding email format |
      | existing@example.com | valid data | error message indicating email is already in use |

