Feature: User Login and Navigation

  As a user
  I want to log in to the Homerunner platform and perform search operations
  So that I can access features and resources efficiently

  Background:
    Given the user is on the Homerunner platform login page
    And the user has valid Gmail credentials

  Scenario: Scenario 1: Successful Login to Homerunner
    Given the user fills in their first name, last name, and password on the login form
    When the user clicks the 'Get Started' button
    Then the user should be redirected to the homepage
    And the user is able to see the username input field after logging out

  Scenario: Scenario 2: Logging into Gmail
    Given the user is logged into the Homerunner platform
    When the user enters valid Gmail credentials
    Then the user should see the logout link displayed for both Homerunner and Gmail accounts

  Scenario: Scenario 3: Page Refresh and Logout
    Given the user is logged into Gmail while also logged into the Homerunner platform
    When the user refreshes the Homerunner page
    Then the user remains logged into both Gmail and the Homerunner platform
    And the user can log out successfully from the Homerunner platform

  Scenario: Scenario 4: Wikipedia Search as a Non-Logged-In User
    Given the user is not logged into the Homerunner platform
    When the user navigates to Wikipedia
    Then the user can select a language from a dropdown
    And the user can enter a search term and execute the search without any relation to the Homerunner platform
