Feature: Provide Search Functionality for Easy Navigation

  As a user seeking help with the web app
  I want to be able to search for relevant documentation articles
  So that I can quickly find answers to my inquiries and utilize the features of the web app effectively

  Background:
    Given the documentation page is available
    And the documentation database contains articles relevant to various topics

  Scenario: Successful search with results
    Given a user is on the documentation page
    When the user searches for a keyword 'pricing'
    Then the system should display a list of relevant documentation articles
    And each article should have a clear title and concise summary

  Scenario: Search with no results
    Given a user is on the documentation page
    When the user searches for a keyword 'non-existent topic'
    Then the system should display a message stating 'No results found'

  Scenario: Documentation page is down
    Given the documentation page is currently unavailable
    When the user attempts to perform a search
    Then the system should respond with an error message: 'The documentation is currently unavailable'

  Scenario: Search without keyword entry
    Given a user is on the documentation page
    When the user does not enter a keyword and attempts a search
    Then the system should display a message stating 'Please enter a keyword to search'

  Scenario Outline: Scenario Outline: Search results
    Given the documentation page is available
    And the user searches for a keyword <keyword>
    When the user executes the search
    Then the system should return <result>
    Examples:
      | keyword | result |
      | account settings | a list of articles related to managing account settings |
      | payment issues | a list of articles addressing payment problems |
      | unknown topic | No results found |

