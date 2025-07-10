Feature: Search Functionality with Delay

  As a user
  I want to receive search results after entering a valid search term
  So that I can find the information I need efficiently

  Background:
    Given the user is on the Wikipedia homepage
    And the search input field is accessible

  Scenario: Valid Search Term
    Given the user enters a valid search term
    When the user clicks the search button
    Then the application initiates a brief delay and displays a loading indicator
    And after a brief delay, the search results are fetched and displayed

  Scenario: No Search Term
    Given the user enters an empty string into the search input field
    When the user clicks the search button
    Then the application prompts 'Please enter a valid search term'

  Scenario: Required Conditions for Search Execution
    Given the user enters a valid search term
    And the user clicks the search button
    When the conditions for a successful search are met
    Then the search results related to the entered term are displayed

  Scenario Outline: Search Terms and Results
    Given the user enters a search term '<search-term>'
    When the user clicks the search button
    Then the system displays search results for '<search-term>'
    Examples:
      | search-term |
      | JavaScript |
      | Python |
      | Gherkin |

