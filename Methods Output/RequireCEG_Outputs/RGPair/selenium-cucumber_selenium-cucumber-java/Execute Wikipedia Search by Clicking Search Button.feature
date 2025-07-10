Feature: Execute Wikipedia Search by Clicking Search Button

  As a user not logged into the application
  I want to search for terms on Wikipedia using a language selection and an input field
  So that I can find relevant information easily

  Background:
    Given the user navigates to the Wikipedia page
    And the language selection dropdown and input field for search terms are visible

  Scenario: Selecting Language and Entering Search Term
    Given the user selects a language from the dropdown
    And the user enters a valid search term in the input field
    When the user clicks the search button
    Then the search process is initiated
    And a temporary loading message is displayed

  Scenario: Viewing Search Results
    Given the search process has completed
    When the user views the search results
    Then the search results are displayed to the user

  Scenario: Closing Browser Window
    Given the user has opened search results
    When the user decides to close the browser window
    Then the browser window closes seamlessly

  Scenario: Loading Message During Search
    Given the user clicks the search button
    Then a temporary loading message is displayed

  Scenario: Search Results Displayed After Loading
    Given a temporary loading message is displayed
    When the application retrieves and displays search results
    Then the search results are displayed to the user

  Scenario Outline: Language Selection and Search Input Validation
    Given the user selects <language> from the dropdown
    And the user enters <search-term> in the input field
    When the user clicks the search button
    Then the search process is initiated
    Examples:
      | language | search-term |
      | English | Gherkin Language |
      | Spanish | Lenguaje Gherkin |
      | French | Langage Gherkin |

