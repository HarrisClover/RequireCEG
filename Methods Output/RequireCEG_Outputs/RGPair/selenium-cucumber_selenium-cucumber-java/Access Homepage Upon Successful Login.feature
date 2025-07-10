Feature: Access Homepage Upon Successful Login

  As a user
  I want to access the homepage after logging in
  So that I can easily navigate the platform and utilize its features

  Background:
    Given the user has valid credentials
    And the user is not currently logged in

  Scenario: Scenario 1: Successful login redirects to homepage
    Given the user enters valid credentials
    And the user is not logged in
    When the user clicks the 'Get Started' button
    Then the user should be redirected to the homepage
    And the logout link should be visible

  Scenario: Scenario 2: Family name field is hidden
    Given the user submits the Homerunner form with first name only
    When the user submits the form
    Then the family name field should no longer be displayed

  Scenario: Scenario 3: Staying logged in with Gmail
    Given the user logs into Gmail
    When the user refreshes the page
    Then the logout link should remain visible
    And the user should be able to log out without losing session details

  Scenario: Scenario 4: Logout process reverts to login screen
    Given the user is logged in and opts to log out
    When the user logs out
    Then the username input field should be displayed again

  Scenario: Scenario 5: Language selection and search on Wikipedia
    Given the user is not logged in
    When the user navigates to Wikipedia, selects a preferred language from the dropdown, and types a search term
    Then the user can execute the search
    And the user can close the browser without loss of data

  Scenario: Scenario 6: Non-logged-in user selects language and searches
    Given the user is not logged in
    When the user selects a preferred language from the dropdown and types in a search term
    Then the search term should be processed successfully, allowing for execution

  Scenario: Scenario 7: User cannot execute search if not logged in
    Given the user is not logged in
    And the user clicks to execute the search
    Then the search should not be executed
