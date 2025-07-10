Feature: Close Browser After Completing Search

  As a user
  I want to search for information on Wikipedia
  So that I can find the information I need without restriction

  Background:
    Given that the user is not logged into Gmail
    And the user navigates to Wikipedia

  Scenario: Scenario 1: Search Wikipedia without Gmail Login
    Given the user selects a language from the dropdown menu
    And the user enters a valid search term in the input field
    When the user clicks the search button
    Then the system initiates a search and loads results
    And the user closes the browser without any errors

  Scenario: Scenario 2: Attempt Search while Logged into Gmail
    Given the user is logged into Gmail
    When the user navigates to Wikipedia
    Then the system presents a message indicating that the user must first log out

  Scenario: Scenario 3: Successful Logout Before Search
    Given the user is logged into Gmail
    When the user logs out from Gmail
    Then the username input field is revealed for logging out
    And the user successfully logs out

  Scenario Outline: Scenario Outline: Logout Before Search
    Given the user is logged into Gmail
    And the user attempts to navigate to Wikipedia
    When the user is prompted to log out
    Then the username input field is revealed for logging out
    Examples:
      | State | Action | Expected Result |
      | Logged in | Navigate to Wikipedia | Message to log out appears |
      | Logged out | Navigate to Wikipedia | Access without restrictions |

