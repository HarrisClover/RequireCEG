Feature: User Authentication and Navigation

  As a user
  I want to securely log into the Homerunner platform and navigate smoothly
  So that I can access the platform features and use them effectively

  Background:
    Given the user is on the login page
    And the user has valid Gmail credentials

  Scenario: User clicks 'Get Started' Button
    Given the user sees the 'Get Started' button
    When the user clicks the 'Get Started' button
    Then the application transitions to a new window
    And the homepage of the Homerunner platform is displayed

  Scenario: User authenticates successfully
    Given the user is on the Homerunner homepage
    When the user inputs valid Gmail credentials
    Then the user is logged in successfully
    And the logout link is visible

  Scenario: User refreshes the page after login
    Given the user is logged in
    When the user refreshes the page
    Then the username input field is displayed again

  Scenario: User logs out
    Given the user is logged in
    When the user chooses to log out
    Then the user is logged out seamlessly
    And the user can log back into Gmail using the same credentials

  Scenario: User navigates while logged out
    Given the user is logged out
    When the user navigates to Wikipedia
    And the user selects a preferred language from a dropdown menu
    Then the user can input a search term on Wikipedia
    And the search can be executed smoothly

  Scenario: Family Name Field is Absent During Authentication
    Given the user is on the login page
    And there is no family name field in the user interface
    Then the system allows the user to fill out the Homerunner form

  Scenario: Logout Link Visibility After Successful Login
    Given the user successfully logs in to the Gmail account
    Then the logout link becomes visible

  Scenario: Post Login Refresh
    Given the user is logged in successfully
    When the user refreshes the page
    Then the username input field is displayed again

  Scenario: Consecutive Logout and Login
    Given the user has logged out
    When the user chooses to log in again using the same Gmail credentials
    Then the user is logged in without issues

  Scenario: Smooth Navigation Experience on Wikipedia
    Given the user is logged out
    When the user navigates to Wikipedia and selects a preferred language
    Then the user experiences a smooth browsing experience on Wikipedia
