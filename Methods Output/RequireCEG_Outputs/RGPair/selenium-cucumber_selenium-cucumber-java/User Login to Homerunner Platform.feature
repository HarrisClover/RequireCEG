Feature: User Login to Homerunner Platform

  As a user
  I want to log into the Homerunner platform
  So that I can access my account and the services offered

  Background:
    Given the user is on the Homerunner platform
    And the 'Get Started' button is visible

  Scenario: Redirect to Homepage
    Given the user clicks the 'Get Started' button
    Then the system should redirect them to the homepage

  Scenario: Initiate Homerunner Form
    Given the user initiates the Homerunner form
    When the user provides their first name
    Then the family name field should not be displayed

  Scenario: Login with Valid Gmail Credentials
    Given the user enters valid Gmail credentials
    When the user submits the login form
    Then the system should display a loading period
    And the user should see a logout link, confirming successful login

  Scenario: Page Refresh Behavior After Login
    Given the user is logged into the system
    When the user refreshes the page
    Then the username input field should appear again
    And the user can log out

  Scenario: Logging Back in with Gmail
    Given the user has logged out
    When the user logs back into Gmail using the same credentials
    Then the logout link should be visible again

  Scenario: Non-Logged-In User Search on Wikipedia
    Given a non-logged-in user navigates to Wikipedia
    When the user selects a language from a dropdown and inputs a search term
    Then the system must enforce a waiting period before they can close the browser

  Scenario: Check Logout Link after Page Refresh
    Given the user has successfully logged into the system
    When the user refreshes the page
    Then the system should present a logout link as confirmation of a successful login

  Scenario: Validate Username Field on Refresh
    Given the user is logged into the system
    When the user refreshes the page
    Then the username input field should appear again to allow for a second login attempt
