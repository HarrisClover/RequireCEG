Feature: Enter Search Term in Input Field on Wikipedia

  As a user
  I want to perform a search on Wikipedia
  So that I can find information on the topic of my interest

  Background:
    Given the user is logged in to the system
    And the user has selected a language from the dropdown

  Scenario: Scenario 1: Successful Search
    Given the user has entered a valid search term
    When the user clicks the search button
    Then the system initiates a waiting period for loading the search results
    And the search results are displayed on the screen

  Scenario: Scenario 2: Missing Language Selection
    Given the user has not selected a language
    When the user attempts to execute the search
    Then an error message is presented indicating that selecting a language is necessary

  Scenario: Scenario 3: Missing Search Term
    Given the user has selected a language
    And the user has not entered a valid search term
    When the user attempts to execute the search
    Then an error message is presented clearly stating that inputting a search term is necessary

  Scenario: Scenario 4: Successful Execution with Conditions
    Given the user has selected a language from the dropdown
    And the user has entered a valid search term
    When the user clicks the search button
    Then the system initiates a waiting period for loading the search results
    And the results are displayed on the screen

  Scenario Outline: Scenario Outline: Search Execution Validation
    Given the user has <language-selected> a language from the dropdown
    And the user has <search-term-condition> a search term
    When the user attempts to search
    Then the outcome should be <expected-outcome>
    Examples:
      | language-selected | search-term-condition | expected-outcome |
      | selected | valid | search proceeds successfully |
      | selected | empty | error message about search term |
      | not selected | valid | error message about language selection |

