Feature: Display corresponding results for authors' books

  As a user searching for books
  I want to find books by entering author names
  So that I can discover works by my favorite authors

  Background:
    Given the system has a database of authors and their books
    And the user is logged into the system

  Scenario: Scenario 1: Complete author name match
    Given the user enters the complete name 'Jane Smith'
    When the user submits the search
    Then the system displays all books authored by 'Jane Smith'
    And no other authors' books are listed

  Scenario: Scenario 2: Partial author name match
    Given the user enters the partial name 'Jane'
    When the user submits the search
    Then the system displays all books authored by any writer with 'Jane' in their name

  Scenario: Scenario 3: Multiple author names search
    Given the user enters the names 'Jane' and 'Smith'
    When the user submits the search
    Then the system compiles and displays all relevant books associated with either 'Jane' or 'Smith'

  Scenario: Scenario 4: No matching authors
    Given the user enters a name that does not match any author, like 'Unknown Author'
    When the user submits the search
    Then the system presents a message stating 'No results were found for your search.'

  Scenario: Scenario 5: Suggest alternate names for misspellings
    Given the user enters a potentially misspelled name 'Jaean Smith'
    When the user submits the search
    Then the system suggests alternate names that closely match 'Jaean Smith'

  Scenario: Scenario 6: Suggest alternate names for other misspellings
    Given the user enters a potentially misspelled name 'Jane Smoth'
    When the user submits the search
    Then the system suggests alternate names that closely match 'Jane Smoth'

  Scenario: Scenario 7: Suggest alternate names for various misspellings
    Given the user enters a potentially misspelled name 'Jana Smit'
    When the user submits the search
    Then the system suggests alternate names that closely match 'Jana Smit'

  Scenario: Scenario 8: Suggest alternate names for uncommon misspellings
    Given the user enters a potentially misspelled name 'Jan Smithson'
    When the user submits the search
    Then the system suggests alternate names that closely match 'Jan Smithson'
