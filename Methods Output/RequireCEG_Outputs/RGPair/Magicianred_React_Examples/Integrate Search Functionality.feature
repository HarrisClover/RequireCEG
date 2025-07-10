Feature: Integrate Search Functionality

  As a website user
  I want to search for information across multiple sections
  So that I can easily find the content I am looking for

  Background:
    Given the user is on the website
    And the search bar is available on the page

  Scenario: Scenario 1: Successful Search with Valid Term
    Given the user enters a valid search term in the search bar
    When the user submits the search
    Then the system displays relevant results from the home page, 'About Us', and 'Contact Us'
    And the details related to matching subsections are shown

  Scenario: Scenario 2: No Results Found
    Given the user enters a search term that does not match any content
    When the user submits the search
    Then the system displays a user-friendly error message indicating no results were found

  Scenario: Scenario 3: Empty Search Input
    Given the user attempts to search without entering a term
    When the user submits the search
    Then the system prompts the user to enter a valid search query

  Scenario: Scenario 4: Vague Search Term
    Given the user enters a vague search term such as a single letter
    When the user submits the search
    Then the system suggests refining the search and encourages the user to use more specific keywords

  Scenario Outline: Scenario Outline: Search Returns Results
    Given the search term is <search-term>
    When the user submits the search
    Then the system returns <matching-results>
    Examples:
      | search-term | matching-results |
      | Who Are | Details about the company |
      | Where Are | Company location information |
      | Contact Us | Contact details |

