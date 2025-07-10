Feature: Access Wikipedia by Non-logged-in Users

  As a non-logged-in user
  I want to navigate the Wikipedia homepage and search for topics
  So that I can access information without having an account

  Background:
    Given the user is not logged in
    And the user is on the Wikipedia homepage

  Scenario: Display language dropdown
    Given the homepage is displayed
    When the user selects a language from the dropdown
    Then the interface updates to reflect the chosen language
    And the user can proceed with a search in that language

  Scenario: Process search request
    Given the user has selected a language and is ready to search
    When the user enters a search term and clicks the search button
    Then a loading animation is displayed
    And the search results are shown after processing

  Scenario: Clear session data on exit
    Given the user has performed a search request
    When the user closes the browser
    Then all session data is cleared including language and search history

  Scenario: Return to homepage without interaction
    Given the user has not interacted with the search field
    When the user chooses to return to the homepage
    Then the user is navigated back to the homepage without prompts

  Scenario: Display language dropdown on homepage
    Given the user is not logged in
    When the user navigates to the Wikipedia homepage and the language dropdown is displayed
    Then the homepage is displayed with the language dropdown

  Scenario: Ensure user can proceed with a valid search
    Given the user has selected a language from the dropdown
    When the user enters a valid search term
    Then the loading animation is displayed
    And the search results are shown after processing

  Scenario: Ensure no interaction leads to homepage return
    Given the user has not interacted with the search field
    When the user chooses to return to the homepage
    Then the user is navigated back to the homepage without prompts
