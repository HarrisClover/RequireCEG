Feature: Show 'Forgot your password?' Link

  As a user of the store
  I want to easily recover my password if I forget it
  So that I can regain access to my account without frustration

  Background:
    Given the user is on the Login page
    And the title 'Login - My Store' is displayed prominently

  Scenario: Scenario 1: Link visibility
    Given the user is on the Login page
    Then 'Forgot your password?' link should be easily visible and clickable

  Scenario: Scenario 2: Redirect to password recovery page
    Given the user sees the 'Forgot your password?' link
    When the user clicks on the 'Forgot your password?' link
    Then the system redirects the user to the password recovery page

  Scenario: Scenario 3: Password recovery process
    Given the user is on the password recovery page
    When the user submits a valid email address
    Then the system generates a confirmation message stating that a password reset link has been sent to the specified email address

  Scenario: Scenario 4: Incorrect login attempt
    Given the user attempts to log in with incorrect credentials
    When the user submits the credentials
    Then the system displays an error message indicating that the credentials are incorrect
    And the system prompts the user to either try again or use the 'Forgot your password?' link for assistance

  Scenario: Scenario 5: Display of 'Forgot your password?' link
    Given the user navigates to the Login page
    Then the system displays the 'Forgot your password?' link below the login form

  Scenario: Scenario 6: Title confirmation
    Given the user is on the Login page
    Then the title 'Login - My Store' is displayed prominently at the top
    And 'Forgot your password?' link is displayed below the login form
