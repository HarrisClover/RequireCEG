Feature: Select Language from Dropdown on Wikipedia

  As a user
  I want to select a language from a dropdown menu
  So that I can view content in my preferred language

  Background:
    Given a user is not logged into the system
    And the homepage is displayed

  Scenario: User selects language from the dropdown
    Given the user sees the language selection dropdown
    When the user selects a language from the dropdown
    Then the search input field should be enabled
    And the user can enter a search term

  Scenario: User initiates a search
    Given the user has entered a search term
    When the user clicks the search button
    Then the system should initiate a loading period
    And the relevant search results should be displayed in the selected language

  Scenario: System displays loading period
    Given the user has clicked the search button
    When the system initiates a loading period
    Then the loading period should be observed before displaying search results

  Scenario: User closes the browser
    Given the user has viewed the search results in their selected language
    When the user closes the browser
    Then all session information should be cleared

  Scenario: Search results loaded successfully
    Given the search results are successfully loaded
    When the user views the search results
    Then the user should see relevant information in the selected language
